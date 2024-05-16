import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';

import 'flutterfire_configure.dart';

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
      // ignore: avoid_dynamic_calls
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

String? fetchLatestTagName(String package) {
  final result = run(
    'gh',
    arguments: [
      'release',
      'list',
      '--json',
      'tagName',
    ],
  );

  return (json.decode(result) as List)
      .cast<Map<String, dynamic>>()
      .map((e) => e['tagName'] as String)
      .firstWhereOrNull((e) => e.startsWith(package));
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

/// fastlaneのmetadataにあるLocaleを取得する
Map<StoreName, List<String>> availableLocalizedLocales(String package) {
  final metadataDir = Directory('packages/$package/.fastlane/metadata');
  final metadataAndroidDir = Directory('${metadataDir.path}/android');

  final result = <StoreName, List<String>>{};

  if (Directory('${metadataDir.path}/default').existsSync()) {
    result[StoreName.AppStore] = [
      'ja',
      'en-US',
    ];
  }

  if (metadataAndroidDir.existsSync()) {
    result[StoreName.GooglePlay] = [
      'ja-JP',
      'en-US',
    ];
  }

  return result;
}

enum StoreName {
  // ignore: constant_identifier_names
  AppStore,
  // ignore: constant_identifier_names
  GooglePlay,
  ;
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

Version splitVersion(String versionString) {
  final regex = RegExp(r'(\d+)\.(\d+)\.(\d+)\+(\d+)$');
  final match = regex.firstMatch(versionString);

  if (match != null) {
    final major = int.parse(match.group(1)!);
    final minor = int.parse(match.group(2)!);
    final patch = int.parse(match.group(3)!);
    final build = int.parse(match.group(4)!);

    return Version(
      major: major,
      minor: minor,
      patch: patch,
      build: build,
    );
  }

  throw const FormatException('Invalid version string');
}

class Version {
  Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
  });

  int major;
  int minor;
  int patch;
  int build;

  @override
  String toString() {
    return '$major.$minor.$patch+$build';
  }

  String toStringNoBuildNumber() {
    return '$major.$minor.$patch';
  }
}

/// pubspec.yamlからパッケージのバージョンを取得する
///
/// like "1.0.0+10"
Version currentVersion(String package) {
  final pubspec = loadYaml(
    File('packages/$package/pubspec.yaml').readAsStringSync(),
  ) as YamlMap;

  final version = pubspec['version'] as String;

  return splitVersion(version);
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
