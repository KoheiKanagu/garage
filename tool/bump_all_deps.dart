import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';

@Task(
  'Bump all dependencies',
)
Future<void> bumpAllDeps() async {
  // root
  _pubAdd('.');

  final packages = Directory('packages').listSync().whereType<Directory>().map(
        (e) => e.uri.pathSegments.reversed.toList()[1],
      );

  for (final packageName in packages) {
    _pubAdd('packages/$packageName');
  }

  run(
    'melos',
    arguments: [
      'run',
      'pub:get',
    ],
  );

  run(
    'melos',
    arguments: [
      'run',
      'pod:install',
    ],
  );

  run(
    'npx',
    arguments: [
      'npm-check-updates',
      '--packageFile',
      'firebase/functions/package.json',
      '--upgrade',
    ],
  );

  run(
    'npm',
    arguments: [
      '--prefix',
      'firebase/functions',
      'install',
    ],
  );
}

void _pubAdd(String pubspecDirectory) {
  final pubspec = loadYaml(
    File('$pubspecDirectory/pubspec.yaml').readAsStringSync(),
  ) as YamlMap;

  final dependencies = (pubspec['dependencies'] is YamlMap)
      ? (pubspec['dependencies'] as YamlMap)
          .entries
          .where((e) => e.value is String)
          .whereNot((e) => e.value == 'any') // exclude any version
          .map((e) => e.key as String)
      : <String>[];

  final devDependencies = (pubspec['dev_dependencies'] is YamlMap)
      ? (pubspec['dev_dependencies'] as YamlMap)
          .entries
          .where((e) => e.value is String)
          .whereNot((e) => e.value == 'any') // exclude any version
          .map((e) => 'dev:${e.key}')
      : <String>[];

  run(
    'fvm',
    arguments: [
      'flutter',
      'pub',
      'add',
      '--directory',
      pubspecDirectory,
      '--no-precompile',
      ...dependencies,
      ...devDependencies,
    ],
  );
}
