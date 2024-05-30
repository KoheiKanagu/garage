import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:melos/melos.dart';
import 'package:path/path.dart' as p;

import '../utils.dart';

@Task(
  'Update coverage_test.dart',
)
Future<void> updateCoverageTest() async {
  final packages = await melosWorkspaceAllPackages();

  for (final e in packages.values) {
    _exec(e);
  }
}

void _exec(Package package) {
  final files = Directory(
    p.join(package.path, 'lib'),
  ).listSync(
    recursive: true,
  );

  final excludeFiles = [
    'app_env.dart',
    'core.dart',
    'firebase_options_dev.dart',
    'firebase_options_prod.dart',
    'global_keys.dart',
    'main_core.dart',
    'main.dart',
    'main_dev.dart',
    'main_prod.dart',
    'my_app.dart',
    'my_go_router.dart',
    'my_navigator_observer.dart',
    'provider_logger.dart',
    'remote_config_constant.dart',
    'typedefs.dart',
  ];

  final exports = files
      .whereType<File>()
      .where((e) => e.path.endsWith('.dart'))
      .map((e) => e.path)
      .map(
        (e) => e.replaceFirst(
          p.join(package.path, 'lib'),
          '',
        ),
      )
      .whereNot((element) => excludeFiles.contains(element.split('/').last))
      .whereNot((element) => element.endsWith('.g.dart'))
      .whereNot((element) => element.endsWith('.freezed.dart'))
      .whereNot((element) => element.endsWith('.gen.dart'))
      .map(
        (e) => "import 'package:${package.name + e}';",
      )
      .toList()
    ..sort();

  File(
    p.join(
      'packages',
      package.name,
      'test',
      'coverage_test.dart',
    ),
  ).writeAsStringSync('''
// ignore_for_file: unused_import
${exports.join('\n')}

void main() {}
''');
}
