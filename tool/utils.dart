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

  bool get hasGooglePlayMetaData => googlePlayMetaDataDirectory.existsSync();

  Directory get googlePlayMetaDataDirectory => Directory(
        p.join(path, '.fastlane/metadata/android'),
      );

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
}
