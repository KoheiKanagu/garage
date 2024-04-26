import 'dart:io';

import 'package:grinder/grinder.dart';

@Task(
  'Upload release notes',
)
Future<void> uploadReleaseNotes() async {
  final dir = Directory('releaseNotes');

  if (!dir.existsSync()) {
    log('No release notes found');
    return;
  }

  final notes = dir.listSync().whereType<File>().where(
        (e) => e.path.endsWith('.md'),
      );

  for (final e in notes) {
    final tag = e.uri.pathSegments.last.replaceAll('.md', '');
    final body = e.readAsStringSync();

    run(
      'gh',
      arguments: [
        'release',
        'edit',
        tag,
        '--notes',
        body,
        '--latest',
      ],
    );
  }
}
