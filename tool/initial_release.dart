import 'dart:async';

import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Create initial GitHub Releases',
)
Future<void> initialRelease() async {
  final package = argumentPackages().single;

  run(
    'git',
    arguments: [
      'diff',
      '--exit-code',
    ],
  );

  run(
    'gh',
    arguments: [
      'pr',
      'create',
      '--assignee',
      '@me',
      '--title',
      'feat($package): Initial Release',
    ],
  );

  await waitMergePr();

  final version = currentVersion(package);

  final newTagName = '$package-v$version';

  run(
    'gh',
    arguments: [
      'release',
      'create',
      newTagName,
      '--target',
      'main',
      '--generate-notes',
      '--draft',
    ],
  );

  run(
    'gh',
    arguments: [
      'release',
      'view',
      newTagName,
      '--web',
    ],
  );
}
