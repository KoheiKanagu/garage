// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:melos/melos.dart';
import 'package:path/path.dart' as p;

import 'utils.dart';

@Task(
  'Create new Releases',
)
Future<void> createNewReleases() async {
  gitPullAndCheckoutMain();

  final oldVersions = await melosWorkspace().then(
    (e) => e.allPackages.values,
  );

  // 各パッケージのバージョンを上げる
  run(
    'melos',
    arguments: [
      'version',
      '--all',
      '--no-git-commit-version',
      '--yes',
    ],
  );

  // コミットしてPRを作る
  createPr();

  // PRがマージされるまで待つ
  final mergeCommitSHA = await waitMergePr();

  final newVersions = await melosWorkspace().then(
    (e) => e.allPackages.values,
  );

  // melos versionでバージョンが上がったか確認
  for (final newVersion in newVersions) {
    final oldVersion = oldVersions.firstWhere((e) => e.name == newVersion.name);

    // バージョンが変わっていない場合は変更点が無いのでスキップ
    if (oldVersion.version == newVersion.version) {
      continue;
    }
    // バージョンが変わっている場合はReleaseを作成する

    // like "listen_to_music_by_location-v1.0.0"
    final newTagName = '${newVersion.name}-v${newVersion.version}';

    // Releaseを作成
    // https://github.com/KoheiKanagu/garage/releases
    run(
      'gh',
      arguments: [
        'release',
        'create',
        newTagName,
        '--title',
        newTagName,
        '--target',
        mergeCommitSHA,
        '--notes',
        "## What's Changed\n\n${newVersion.changelogUrl}",
      ],
    );

    // 各ストアにアップロードするためのリリースノートを作成
    createReleaseNotesTemplate(newVersion);
  }
}

void createReleaseNotesTemplate(Package package) {
  final changelogUrl = package.changelogUrl;

  final jaTemplate = '''
- 軽微な不具合を修正しました。
- より詳しい変更点は $changelogUrl をご覧ください。
''';

  final enTemplate = '''
- Fixed minor bugs.
- For more details, check out $changelogUrl
''';

  final path = package.path;

  // AppStore向けのリリースノートを作成
  for (final locale in ['ja', 'en-US']) {
    final dir = Directory(
      p.joinAll(
        [path, '.fastlane/metadata/$locale'],
      ),
    );

    if (dir.existsSync()) {
      final file = File(
        p.join(dir.path, 'release_notes.txt'),
      )..writeAsStringSync(locale == 'ja' ? jaTemplate : enTemplate);

      run(
        'open',
        arguments: [
          file.path,
        ],
      );
    }
  }

  // Google Play向けのリリースノートを作成
  for (final locale in ['ja-JP', 'en-US']) {
    final dir = Directory(
      p.joinAll(
        [path, '.fastlane/metadata/android/$locale/changelogs'],
      ),
    );

    if (dir.existsSync()) {
      final file = File(
        p.join(dir.path, 'default.txt'),
      )..writeAsStringSync(locale == 'ja-JP' ? jaTemplate : enTemplate);

      run(
        'open',
        arguments: [
          file.path,
        ],
      );
    }
  }
}

void createPr() {
  final hash = run(
    'git',
    arguments: [
      'rev-parse',
      '--short',
      'HEAD',
    ],
  ).trim();
  final releaseBranch = 'releases/$hash';

  run(
    'git',
    arguments: [
      'checkout',
      '-b',
      releaseBranch,
    ],
  );

  run(
    'git',
    arguments: [
      'add',
      '.',
    ],
  );

  run(
    'git',
    arguments: [
      'commit',
      '-m',
      'chore: Bump packages',
    ],
  );

  run(
    'git',
    arguments: [
      'push',
      'origin',
      releaseBranch,
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

extension PackageExtension on Package {
  String get changelogUrl =>
      'https://github.com/KoheiKanagu/garage/packages/$name/CHANGELOG.md';
}
