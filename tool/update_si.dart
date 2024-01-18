import 'dart:io';

import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Update si files',
)
Future<void> updateCi() async {
  final packages = await runMelosList();

  for (final e in packages) {
    final dir = Directory('${e.path}/assets/svg');
    if (dir.existsSync() == false) {
      continue;
    }

    final svgs =
        dir.listSync().where((element) => element.path.endsWith('.svg'));

    for (final svg in svgs) {
      await runAsync(
        'dart',
        arguments: [
          'run',
          'jovial_svg:svg_to_si',
          svg.path,
          '--out',
          '${e.path}/assets/si',
        ],
        workingDirectory: e.path,
      );
    }
  }
}
