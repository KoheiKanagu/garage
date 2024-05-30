import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as p;

import '../utils.dart';

@Task(
  'Run dart format on all packages',
)
Future<void> dartFormatAll() async {
  final packages = await melosWorkspaceAllPackages();

  final targets = [
    Directory('tool'),
    ...packages.values.map(
      (e) => Directory(
        p.join(e.path, 'lib'),
      ),
    ),
    ...packages.values.map(
      (e) => Directory(
        p.join(e.path, 'test'),
      ),
    ),
  ];

  final files = targets
      .map(
        (e) => e
            .listSync(recursive: true)
            .where((e) => e.path.endsWith('.dart'))
            .whereNot((e) => e.path.endsWith('.gen.dart'))
            .whereNot((e) => e.path.endsWith('.freezed.dart'))
            .whereNot((e) => e.path.endsWith('.g.dart')),
      )
      .flattened;

  run(
    'dart',
    arguments: [
      'format',
      ...files.map((e) => e.path),
    ],
  );
}
