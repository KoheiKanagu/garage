import 'dart:async';

import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Create initial GitHub Releases',
)
Future<void> initialRelease() async {
  final package = await argumentScopes().then(
    (v) => v.values.single,
  );

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
      '"feat: Initial Release of ${package.name}"',
      '--body',
      'Initial Release',
    ],
  );

  await waitMergePr();

  final newTagName = '${package.name}-v${package.version}';

  run(
    'gh',
    arguments: [
      'release',
      'create',
      newTagName,
      '--title',
      newTagName,
      '--notes',
      '# Initial Release',
      '--target',
      'main',
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
