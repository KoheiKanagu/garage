import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Update si files',
)
Future<void> updateSi() async {
  final packages = await runMelosList();

  final futures = packages.map(
    (e) {
      final dir = Directory('${e.path}/assets/svg');
      if (!dir.existsSync()) {
        return <Future<String>>[];
      }

      return dir
          .listSync()
          .where(
            (element) => element.path.endsWith('.svg'),
          )
          .map(
            (svg) => runAsync(
              'dart',
              arguments: [
                'run',
                'jovial_svg:svg_to_si',
                svg.path,
                '--out',
                '${e.path}/assets/si',
              ],
              workingDirectory: e.path,
            ),
          );
    },
  );

  await Future.wait(futures.flattened);
}
