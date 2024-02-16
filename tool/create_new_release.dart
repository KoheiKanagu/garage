import 'dart:convert';

import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Create a new release',
)
void createNewRelease() {
  // like "listen_to_music_by_location"
  final package = argumentPackage();

  pullAndCheckoutMain();

  final currentVersion = getCurrentVersion(package);

  // like listen_to_music_by_location-v1.0.0+17
  final newTagName = '$package-v$currentVersion';

  final latestTagName = fetchLatestTagName(package);

  run(
    'gh',
    arguments: [
      'release',
      'create',
      newTagName,
      '--generate-notes',
      '--notes-start-tag',
      latestTagName,
      '--draft',
    ],
  );

  final createdRelease = json.decode(
    run(
      'gh',
      arguments: [
        'release',
        'view',
        newTagName,
        '--json',
        'tagName,body',
      ],
    ),
  ) as Map<String, dynamic>;

  final createdReleaseTagName = createdRelease['tagName'] as String;
  final createdReleaseBody = createdRelease['body'] as String;
  final createdReleaseUrl =
      'https://github.com/KoheiKanagu/garage/releases/tag/$newTagName';

  final availableLocales = availableLocalizedLocales(package);

  final releaseNotes = StringBuffer()
    ..writeln('# Release Notes')
    ..writeln(
      'This format is generated by https://github.com/KoheiKanagu/garage/blob/main/tool/create_new_release.dart.',
    )
    ..writeln('```yaml');

  for (final store in StoreName.values) {
    if (availableLocales.containsKey(store)) {
      releaseNotes.writeln('${store.name}:');
      for (final locale in availableLocales[store]!) {
        releaseNotes.writeln('  $locale:');
        if (locale == 'ja') {
          releaseNotes
            ..writeln('    - 軽微な不具合を修正しました。')
            ..writeln('    - より詳しい変更点は $createdReleaseUrl をご覧ください。');
        } else {
          releaseNotes
            ..writeln('    - Fixed minor bugs.')
            ..writeln('    - For more details, check out $createdReleaseUrl');
        }
      }
    }
  }
  releaseNotes
    ..writeln('```')
    ..writeln()
    ..writeln(createdReleaseBody);

  run(
    'gh',
    arguments: [
      'release',
      'edit',
      createdReleaseTagName,
      '--notes',
      releaseNotes.toString(),
    ],
  );

  run(
    'gh',
    arguments: [
      'release',
      'view',
      createdReleaseTagName,
      '--web',
    ],
  );
}