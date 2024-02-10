import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';

@Task(
  'Bump all dependencies',
)
Future<void> bumpAllDeps() async {
  final packages = Directory('packages').listSync().whereType<Directory>().map(
        (e) => e.uri.pathSegments.reversed.toList()[1],
      );

  for (final packageName in packages) {
    final file = File(
      Directory('packages/$packageName/pubspec.yaml').path,
    ).readAsStringSync();

    final pubspec = loadYaml(file) as YamlMap;

    final dependencies = (pubspec['dependencies'] as YamlMap)
        .entries
        .where((e) => e.value is String)
        .map((e) => e.key as String);

    final devDependencies = (pubspec['dev_dependencies'] as YamlMap)
        .entries
        .where((e) => e.value is String)
        .map((e) => 'dev:${e.key}');

    run(
      'fvm',
      arguments: [
        'flutter',
        'pub',
        'add',
        '--directory',
        'packages/$packageName',
        '--no-precompile',
        ...dependencies,
        ...devDependencies,
      ],
    );
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
      'pod:update',
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
