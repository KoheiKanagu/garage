// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

@Task(
  "Replace remoteconfig.template.json's conditions",
)
void replaceRemoteconfigTemplateConditions() {
  final list = run(
    'firebase',
    arguments: [
      'apps:list',
      '--json',
    ],
  );
  // e.g.
  // {
  //   "status": "success",
  //   "result": [
  //     {
  //       "name": "projects/kingu-garage-dev/iosApps/1:682848709439:ios:3361e1e37cb0d30884c18a",
  //       "displayName": "listen_to_music_by_location",
  //       "platform": "IOS",
  //       "appId": "1:682848709439:ios:3361e1e37cb0d30884c18a",
  //       "namespace": "dev.kingu.listenToMusicByLocation.dev",
  //       "apiKeyId": "f76e615c-c000-4b6e-8aff-798a7246d7be",
  //       "state": "ACTIVE",
  //       "expireTime": "1970-01-01T00:00:00Z"
  //     }
  //   ]
  // }
  final response = json.decode(list) as Map<String, dynamic>;
  final result = response['result'] as List<dynamic>;

  final target = File('remoteconfig.template.json');
  final template =
      json.decode(target.readAsStringSync()) as Map<String, dynamic>;

  // e.g.
  // "conditions": [
  //   {
  //     "name": "dev.kingu.listenToMusicByLocation",
  //     "expression": "app.id == '1:682848709439:ios:3361e1e37cb0d30884c18a'",
  //     "tagColor": "ORANGE"
  //   }
  // ],
  final conditions = template['conditions'] as List<dynamic>;

  template['conditions'] = result
      .map((e) => e as Map<String, dynamic>)
      .map(
        (e) => conditions
            .map((e) => e as Map<String, dynamic>)
            .firstWhere(
              (element) =>
                  element['name'] ==
                  // e.g.
                  // dev.kingu.listenToMusicByLocation.dev -> dev.kingu.listenToMusicByLocation
                  (e['namespace'] as String).replaceFirst(
                    RegExp(r'\.dev$'),
                    '',
                  ),
            )
            .map(
              (key, value) => key == 'expression'
                  ? MapEntry(key, "app.id == '${e['appId']}'")
                  : MapEntry(key, value),
            ),
      )
      .toList();

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
