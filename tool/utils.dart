// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:glob/glob.dart';
import 'package:grinder/grinder.dart';
import 'package:melos/melos.dart';
import 'package:path/path.dart' as p;

Future<MelosWorkspace> melosWorkspace({
  PackageFilters? packageFilters,
}) async =>
    Melos(
      config: await MelosWorkspaceConfig.fromWorkspaceRoot(
        Directory.current,
      ),
    ).createWorkspace(
      packageFilters: packageFilters,
    );

Future<PackageMap> melosWorkspaceAllPackages() => melosWorkspace().then(
      (v) => v.allPackages,
    );

bool argumentDryRun() {
  return context.invocation.arguments.getFlag('dry-run');
}

Future<PackageMap> argumentScopes() async {
  final args = context.invocation.arguments;

  final argsScopes = args.getOption('scopes');

  if (argsScopes == null) {
    final scopes = await melosWorkspace().then(
      (v) => v.allPackages.keys.join(','),
    );

    log('example:');
    log('```');
    log('--scopes=$scopes');
    log('or');
    log('--scopes=all');
    log('```');
    fail('--scopes is required');
  }

  if (argsScopes == 'all') {
    return melosWorkspace().then((v) => v.allPackages);
  }

  return melosWorkspace(
    packageFilters: PackageFilters(
      scope: argsScopes.split(',').map(Glob.new).toList(),
    ),
  ).then(
    (v) => v.filteredPackages,
  );
}

void gitPullAndCheckoutMain() {
  run(
    'git',
    arguments: [
      'fetch',
      '--all',
    ],
  );

  run(
    'git',
    arguments: [
      'checkout',
      'main',
    ],
  );

  run(
    'git',
    arguments: [
      'pull',
      'origin',
      'main',
    ],
  );
}

/// PRがマージされるまで待つ
///
/// PRがマージされると、マージされたコミットのSHAを返す
Future<String> waitMergePr() async {
  final completer = Completer<String>();

  Timer.periodic(
    const Duration(seconds: 30),
    (timer) {
      final result = run(
        'gh',
        arguments: [
          'pr',
          'view',
          '--json',
          'mergedAt,mergeCommit',
        ],
      );

      final data = json.decode(result) as Map<String, dynamic>;
      final mergedAt = data['mergedAt'] as String?;
      if (mergedAt != null) {
        final mergeCommit = data['mergeCommit']['oid'] as String;

        timer.cancel();
        completer.complete(mergeCommit);
      }
    },
  );

  return completer.future;
}

extension PackageExtension on Package {
  bool get hasAppStoreMetaData => Directory(
        p.join(appStoreMetaDataDirectory.path, 'default'),
      ).existsSync();

  Directory get appStoreMetaDataDirectory => Directory(
        p.join(path, '.fastlane/metadata'),
      );

  List<String> get appStoreSupportLocales => switch (name) {
        _ => ['ja', 'en-US'],
      };

  List<
      ({
        String locale,
        File releaseNote,
        String noteTemplate,
        bool isJapanese,
        String appName,
      })> get appStoreReleaseNotes => switch (name) {
        _ => appStoreSupportLocales
            .map(
              (e) => (
                locale: e,
                releaseNote: File(
                  p.join(
                    appStoreMetaDataDirectory.path,
                    e,
                    'release_notes.txt',
                  ),
                ),
                noteTemplate:
                    e == 'ja' ? _releaseNoteTemplateJa : _releaseNoteTemplateEn,
                isJapanese: e == 'ja',
                appName: File(
                  p.join(
                    appStoreMetaDataDirectory.path,
                    e,
                    'name.txt',
                  ),
                ).readAsStringSync().trim(),
              ),
            )
            .toList(),
      };

  bool get hasGooglePlayMetaData => googlePlayMetaDataDirectory.existsSync();

  Directory get googlePlayMetaDataDirectory => Directory(
        p.join(path, '.fastlane/metadata/android'),
      );

  List<String> get googlePlaySupportLocales => switch (name) {
        _ => ['ja-JP', 'en-US'],
      };

  List<
      ({
        String locale,
        File releaseNote,
        String noteTemplate,
        bool isJapanese,
        String appName,
      })> get googlePlayReleaseNotes => switch (name) {
        _ => googlePlaySupportLocales
            .map(
              (e) => (
                locale: e,
                releaseNote: File(
                  p.join(
                    googlePlayMetaDataDirectory.path,
                    e,
                    'changelogs',
                    'default.txt',
                  ),
                ),
                noteTemplate: e == 'ja-JP'
                    ? _releaseNoteTemplateJa
                    : _releaseNoteTemplateEn,
                isJapanese: e == 'ja-JP',
                appName: File(
                  p.join(
                    googlePlayMetaDataDirectory.path,
                    e,
                    'title.txt',
                  ),
                ).readAsStringSync().trim(),
              ),
            )
            .toList(),
      };

  String get iosBundleId => switch (name) {
        'listen_to_music_by_location' => 'dev.kingu.listenToMusicByLocation',
        'obento' => 'dev.kingu.obento',
        _ => throw UnimplementedError(),
      };

  String get androidPackageName => switch (name) {
        'listen_to_music_by_location' =>
          'dev.kingu.listen_to_music_by_location',
        'obento' => 'dev.kingu.obento',
        _ => throw UnimplementedError(),
      };

  String get changelogUrl =>
      'https://github.com/KoheiKanagu/garage/blob/main/packages/$name/CHANGELOG.md';

  String get _releaseNoteTemplateJa => switch (name) {
        _ => '''
- 軽微な不具合を修正しました。
- より詳しい変更点は $changelogUrl をご覧ください。
'''
      };

  String get _releaseNoteTemplateEn => switch (name) {
        _ => '''
- Fixed minor bugs.
- For more details, check out $changelogUrl.
'''
      };

  Uri get lp => Uri.parse(
        switch (name) {
          'listen_to_music_by_location' => 'https://garage.kingu.dev/locamusic',
          'obento' => 'https://garage.kingu.dev/obento',
          _ => throw UnimplementedError(),
        },
      );
}
