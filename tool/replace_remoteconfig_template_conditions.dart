// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

@Task(
  'Update core export',
)
void replaceRemoteconfigTemplateConditions() {
  final target = File('remoteconfig.template.json');
  final raw = target.readAsStringSync();

  final template = json.decode(raw) as Map<String, dynamic>;
  template['conditions'] = (template['conditions'] as List<dynamic>).map(
    (e) {
      // アプリ別の条件が定義されているexpressionではないものはそのまま
      if (!(e['expression'] as String).startsWith('app.id == ')) {
        log('Skip: ${e['name']}');
        return e;
      }
      log('Replace: ${e['name']}');

      final name = e['name'] as String;
      final expression = e['expression'] as String;

      final String platform;
      if (expression.contains('ios')) {
        platform = 'ios';
      } else if (expression.contains('android')) {
        platform = 'android';
      } else {
        throw Exception('Unknown platform');
      }

      final firebaseJson = json.decode(
        // e.g. packages/listen_to_music_by_location/firebase.json
        File('packages/$name/firebase.json').readAsStringSync(),
      ) as Map<String, dynamic>;

      // prodのappIdを取得
      final prodAppId = firebaseJson['flutter']['platforms']['dart']
              ['lib/constants/firebase_options_prod.dart']['configurations']
          [platform] as String;
      log('prodAppId: $prodAppId');

      // expressionを置換
      return e..['expression'] = "app.id == '$prodAppId'";
    },
  ).toList();

  target.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(template),
    flush: true,
  );

  run(
    'git',
    arguments: [
      'diff',
    ],
  );
}
