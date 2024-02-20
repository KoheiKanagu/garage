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
      'chore: Bump $branch',
    ],
  );

  final createPr = args.hasFlag('create-pr');
  if (createPr) {
    run(
      'git',
      arguments: [
        'push',
        'origin',
        'releases/$branch',
      ],
    );

    run(
      'gh',
      arguments: [
        'pr',
        'create',
        '--assignee',
        '@me',
        '--fill-first',
      ],
    );

    run(
      'gh',
      arguments: [
        'pr',
        'merge',
        '--auto',
        '--squash',
      ],
    );
  }
}
