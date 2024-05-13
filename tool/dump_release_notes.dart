// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:markdown/markdown.dart';
import 'package:yaml/yaml.dart';

import 'utils.dart';

@Task(
  'Dump release notes',
)
void dumpReleaseNotes() {
  final packages = argumentPackages();

  for (final package in packages) {
    final latestTagName = fetchLatestTagName(package);

    if (latestTagName == null) {
      log('No release found');
      continue;
    }

    final buildNumber = splitVersion(latestTagName).build;
    final availableLocales = availableLocalizedLocales(package);
    final releaseNotesYaml = fetchLatestReleaseNotes(latestTagName);

    for (final e in availableLocales.entries) {
      final store = e.key;
      final locales = e.value;

      for (final locale in locales) {
        // エラーになる場合はそもそもRelease Notesの書き方が合っていない
        final list = releaseNotesYaml[store.name][locale] as YamlList;

        final notesPath = switch (store) {
          StoreName.AppStore =>
            'packages/$package/.fastlane/metadata/$locale/release_notes.txt',
          StoreName.GooglePlay =>
            'packages/$package/.fastlane/metadata/$locale/changelogs/$buildNumber.txt',
        };

        File(notesPath).writeAsStringSync(
          // "-" を先頭につける
          list.map((e) => '- ${e as String}').join('\n'),
          flush: true,
        );
      }
    }
  }
}

YamlMap fetchLatestReleaseNotes(String tag) {
  final latestRelease = json.decode(
    run(
      'gh',
      arguments: [
        'release',
        'view',
        tag,
        '--json',
        'body',
      ],
    ),
  ) as Map<String, dynamic>;

  final body = latestRelease['body'] as String;

  return Document(
    extensionSet: ExtensionSet.gitHubFlavored,
  )
      .parse(body)
      .whereType<Element>()
      .where((e) => e.tag == 'pre')
      .map((e) => e.children?.first.textContent)
      .whereNotNull()
      .map((e) => loadYamlDocument(e).contents as YamlMap)
      .first;
}
