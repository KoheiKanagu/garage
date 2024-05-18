// ignore_for_file: avoid_dynamic_calls

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:melos/melos.dart';
import 'package:pub_semver/pub_semver.dart';

import 'flutterfire_configure.dart';

Future<MelosWorkspace> melosWorkspace() async => Melos(
      config: await MelosWorkspaceConfig.fromWorkspaceRoot(
        Directory.current,
      ),
    ).createWorkspace();

Future<List<Directory>> runMelosList() async {
  final result = await runAsync(
    'melos',
    arguments: [
      'list',
      '--json',
    ],
  );
  return (json.decode(result) as List)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => e['location'] as String)
      .map(Directory.new)
      .toList();
}

bool argumentDryRun() {
  return context.invocation.arguments.getFlag('dry-run');
}

List<String> argumentPackages() {
  final args = context.invocation.arguments;

  final argsPackages = args.getOption('packages');

  if (argsPackages == null) {
    log('example:');
    log('```');
    log('--packages=${packages.map((e) => e.directory).join(",")}');
    log('or');
    log('--packages=all');
    log('```');
    fail('--packages is required');
  }

  return argsPackages == 'all'
      ? packages.map((e) => e.directory).toList()
      : argsPackages.split(',');
}

String argumentPackage() {
  final args = context.invocation.arguments;

  final package = args.getOption('package');
  if (package == null) {
    final packages = run(
      'melos',
      arguments: [
        'list',
        '--json',
      ],
      quiet: true,
    );
    final names = (json.decode(packages) as List<dynamic>).map(
      (e) => e['name'] as String,
    );

    log('example:');
    log('```');
    for (final name in names) {
      log('--package=$name');
    }
    log('```');
    fail('--package is required');
  }

  return package;
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

String getIosBundleId(String package) => packages
    .firstWhere(
      (e) => e.directory == package,
    )
    .bundleId;

String getAndroidPackageName(String package) => packages
    .firstWhere(
      (e) => e.directory == package,
    )
    .packageName;

/// pubspec.yamlからパッケージのバージョンを取得する
///
/// like "1.0.0+10"
Future<Version> currentVersion(String package) {
  return melosWorkspace().then(
    (e) => e.allPackages[package]!.version,
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
