// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

@Task(
  "Replace remoteconfig.template.json's conditions",
)
void replaceRemoteconfigTemplateConditions() {
  final target = File('remoteconfig.template.json');
  final raw = target.readAsStringSync();

  final template = json.decode(raw) as Map<String, dynamic>;
  template['conditions'] = (template['conditions'] as List<dynamic>).map(
    (e) {
      // Keep expressions that are not defined for individual apps as they are
      if (!(e['expression'] as String).startsWith('app.id == ')) {
        log('Skip: ${e['name']}');
        return e;
      }
      log('Replace: ${e['name']}');

      // suffixes are '_ios' or '_android'
      final name = (e['name'] as String)
          .replaceFirst('_ios', '')
          .replaceFirst('_android', '');
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

      // Verify the appId for dev
      final devAppId = firebaseJson['flutter']['platforms']['dart']
              ['lib/constants/firebase_options_dev.dart']['configurations']
          [platform] as String;
      log('devAppId: $devAppId');
      if (expression != "app.id == '$devAppId'") {
        throw Exception('devAppId does not match');
      }

      // Get the appId for prod
      final prodAppId = firebaseJson['flutter']['platforms']['dart']
              ['lib/constants/firebase_options_prod.dart']['configurations']
          [platform] as String;
      log('prodAppId: $prodAppId');

      // Replace the expression
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

void main(List<String> args) {
  replaceRemoteconfigTemplateConditions();
}
