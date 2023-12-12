import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:yaml_edit/yaml_edit.dart';

@Task(
  'バージョン番号をbumpする',
)
void bump() {
  final args = context.invocation.arguments;

  final package = args.getOption('package');
  if (package == null) {
    final packages = run(
      'melos',
      arguments: [
        'list',
        '--json',
      ],
      quiet: true,
    );
    final names = (json.decode(packages) as List<dynamic>).map(
      // ignore: avoid_dynamic_calls
      (e) => e['name'] as String,
    );

    log('example:');
    log('```');
    for (final name in names) {
      log('grind bump --package=$name');
    }
    log('```');
    fail('--package is required');
  }

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
      'release/$branch',
    ],
  );

  run(
    'git',
    arguments: [
      'add',
      'packages/$package/pubspec.yaml',
    ],
  );

  run(
    'git',
    arguments: [
      'commit',
      '-m',
      '[skip ci] Bump $branch',
    ],
  );
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
