import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:intl/locale.dart' as intl;
import 'package:yaml_edit/yaml_edit.dart';

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

/// pubspec.yamlからパッケージのバージョンを取得する
///
/// like "1.0.0+10"
String getCurrentVersion(String package) {
  final pubspecFile = File('packages/$package/pubspec.yaml');
  final pubspec = YamlEditor(
    pubspecFile.readAsStringSync(),
  );
  return pubspec.parseAt(['version']).value as String;
}

String fetchLatestTagName(String package) {
  final result = run(
    'gh',
    arguments: [
      'release',
      'list',
      '--json',
      'tagName',
    ],
  );
  final tagNames = (json.decode(result) as List)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => e['tagName'] as String)
      .toList();
  final tagName = tagNames.firstWhere(
    (element) => element.startsWith(package),
  );

  return tagName;
}

void pullAndCheckoutMain() {
  run(
    'git',
    arguments: [
      'pull',
    ],
  );

  run(
    'git',
    arguments: [
      'checkout',
      'main',
    ],
  );
}

/// [package] がfastlane deliverで対応しているLocaleを取得する
Map<StoreName, List<String>> availableLocalizedLocales(String package) {
  final metadataDir = Directory('packages/$package/.fastlane/metadata');
  final metadataAndroidDir = Directory('${metadataDir.path}/android');

  final result = <StoreName, List<String>>{};

  if (metadataAndroidDir.existsSync()) {
    // TODO: Android
  }

  final locales = metadataDir
      .listSync()
      .whereType<Directory>()
      .map((e) {
        final seg = e.uri.pathSegments;
        // ディレクトリの場合は.lastだと空白になる
        return seg[seg.length - 2];
      })
      // 共有するdefaultは除外
      .whereNot((e) => e == 'default')
      .where(
        // 何らかのLocaleのディレクトリであるものだけを抽出
        (e) => intl.Locale.tryParse(e) != null,
      )
      .toList()
    ..sort();

  result[StoreName.AppStore] = locales;

  return result;
}

enum StoreName {
  // ignore: constant_identifier_names
  AppStore,
  // ignore: constant_identifier_names
  GooglePlay,
  ;
}
