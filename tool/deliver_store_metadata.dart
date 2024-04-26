// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:markdown/markdown.dart';
import 'package:yaml/yaml.dart';

import 'utils.dart';

@Task(
  'Deliver store metadata',
)
void deliverStoreMetadata() {
  final packages = argumentPackages();

  for (final package in packages) {
    final latestTagName = fetchLatestTagName(package);

    if (latestTagName == null) {
      log('No release found');
      continue;
    }

    final version = splitVersion(latestTagName);
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
            'packages/$package/.fastlane/metadata/$locale/changelogs/default.txt',
        };

        File(notesPath).writeAsStringSync(
          // "-" を先頭につける
          list.map((e) => '- ${e as String}').join('\n'),
          flush: true,
        );
      }
    }

    if (argumentDryRun()) {
      log('== == == == ');
      log('  Dry run');
      log('== == == == ');
      return;
    }

    for (final store in availableLocales.keys) {
      switch (store) {
        case StoreName.AppStore:
          run(
            'fastlane',
            arguments: [
              'deliver',
              '--skip_binary_upload',
              'true',
              '--skip_screenshots',
              'true',
              '--precheck_include_in_app_purchases',
              'false',
              '--force',
              'true',
              '--app_identifier',
              getIosBundleId(package),
              '--app_version',
              version.toStringNoBuildNumber(),
            ],
            workingDirectory: 'packages/$package',
          );
        case StoreName.GooglePlay:
          run(
            'fastlane',
            arguments: [
              'supply',
              '--skip_upload_apk',
              'true',
              '--skip_upload_aab',
              'true',
              '--skip_upload_images',
              'true',
              '--skip_upload_screenshots',
              'true',
              '--metadata_path',
              '.fastlane/metadata/android',
              '--package_name',
              getAndroidPackageName(package),
              '--track',
              'alpha',
              '--version_code',
              // このバージョンのリリースが存在している必要がある
              version.build.toString(),
            ],
            workingDirectory: 'packages/$package',
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
