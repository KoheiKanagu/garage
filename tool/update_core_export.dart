import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';

@Task(
  'Update core export',
)
void updateCoreExport() {
  final files = Directory('packages/core/lib').listSync(
    recursive: true,
  );

  final exports = files
      .whereType<File>()
      .where((e) => e.path.endsWith('.dart'))
      .map((e) => e.path)
      .map((e) => e.replaceFirst('packages/core/lib/', ''))
      .whereNot((element) => element == 'core.dart')
      .whereNot((element) => element == 'constants/collection_path.dart')
      .whereNot((element) => element.endsWith('.g.dart'))
      .whereNot((element) => element.endsWith('.freezed.dart'))
      .map(
        (e) => e.endsWith('_route.dart')
            ? "export '$e' hide \$appRoutes;"
            : "export '$e';",
      )
      .toList()
    ..sort();

  File('packages/core/lib/core.dart').writeAsStringSync(
    "${exports.join('\n')}\n",
  );
}
