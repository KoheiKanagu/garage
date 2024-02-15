import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:yaml_edit/yaml_edit.dart';

import 'utils.dart';

@Task(
  '''
Bumps the version number and creates a new release branch.

--package: [Required] The package name.

--major: Bump the major version.
--minor: Bump the minor version.
--patch: [Default] Bump the patch version.

--create-pr: Create a pull request.
  ''',
)
void bump() {
  final args = context.invocation.arguments;
  final package = argumentPackage();

  pullAndCheckoutMain();

  final pubspecFile = File('packages/$package/pubspec.yaml');
  final pubspec = YamlEditor(
    pubspecFile.readAsStringSync(),
  );

  final version = pubspec.parseAt(['version']).value as String;
  log('');
  log('current version: $version');

  final newVersion = splitVersion(version);

  if (args.getFlag('major')) {
    newVersion.major++;
  }
  if (args.getFlag('minor')) {
    newVersion.minor++;
  }
  if (args.getFlag('patch')) {
    newVersion.patch++;
  }

  newVersion.build++;

  final newVersionString = newVersion.toString();
  log('new version: $newVersionString');
  log('');

  pubspec.update(['version'], newVersionString);

  pubspecFile.writeAsStringSync(
    pubspec.toString(),
  );

  final branch = '$package-v$newVersionString';

  log('branch');
  log(branch);
  log('');

  run(
    'git',
    arguments: [
      'checkout',
      '-b',
      'releases/$branch',
    ],
  );

  run(
    'git',
    arguments: [
      'add',
      pubspecFile.path,
    ],
  );

  run(
    'git',
    arguments: [
      'commit',
      '-m',
      'chore($package): Bump $branch',
    ],
  );

  final createPr = args.hasFlag('create-pr');
  if (createPr) {
    run(
      'gh',
      arguments: [
        'pr',
        'create',
        '--base',
        'main',
        '--head',
        'releases/$branch',
        '--fill',
        '--assignee',
        '@me',
        '--web',
      ],
    );
  }
}

Version splitVersion(String versionString) {
  final regex = RegExp(r'^(\d+)\.(\d+)\.(\d+)\+(\d+)$');
  final match = regex.firstMatch(versionString);

  if (match != null) {
    final major = int.parse(match.group(1)!);
    final minor = int.parse(match.group(2)!);
    final patch = int.parse(match.group(3)!);
    final build = int.parse(match.group(4)!);

    return Version(
      major: major,
      minor: minor,
      patch: patch,
      build: build,
    );
  }

  throw const FormatException('Invalid version string');
}

class Version {
  Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
  });

  int major;
  int minor;
  int patch;
  int build;

  @override
  String toString() {
    return '$major.$minor.$patch+$build';
  }
}
