// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Upload symbols to Firebase Crashlytics',
)
void crashlyticsSymbolsUpload() {
  final package = argumentPackage();

  final args = context.invocation.arguments;
  final env = args.getOption('env');

  final firebase = json.decode(
    File(
      'packages/$package/firebase.json',
    ).readAsStringSync(),
  ) as Map<String, dynamic>;

  final appId = switch (env) {
    'dev' => firebase['flutter']['platforms']['android']['buildConfigurations']
        ['src/dev']['appId'],
    'prod' => firebase['flutter']['platforms']['android']['buildConfigurations']
        ['src/prod']['appId'],
    _ => throw ArgumentError('Invalid argument: $env'),
  } as String;

  run(
    'firebase',
    arguments: [
      'crashlytics:symbols:upload',
      '--app',
      appId,
      'build/app/outputs/app.android-*.symbols',
    ],
  );
}
