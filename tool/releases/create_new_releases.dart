// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:grinder/grinder.dart';
import 'package:melos/melos.dart';

import '../utils.dart';

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
  run(
    'melos',
    arguments: [
      'run',
      'pub:get',
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
  if (package.hasAppStoreMetaData) {
    for (final e in package.appStoreReleaseNotes) {
      e.releaseNote.writeAsStringSync(
        e.noteTemplate,
      );

      run(
        'open',
        arguments: [
          e.releaseNote.path,
        ],
      );
    }
  }

  if (package.hasGooglePlayMetaData) {
    for (final e in package.googlePlayReleaseNotes) {
      e.releaseNote.writeAsStringSync(
        e.noteTemplate,
      );

      run(
        'open',
        arguments: [
          e.releaseNote.path,
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
