import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';
import 'package:pub_semver/pub_semver.dart';

import '../utils.dart';

@Task(
  'Post to X',
)
Future<void> postX() async {
  final packages = await argumentScopes();

  final urlSet = packages.values
      .map(
        (package) {
          if (package.hasAppStoreMetaData) {
            return package.appStoreReleaseNotes.map(
              (e) => _build(
                appName: e.appName,
                isJapanese: e.isJapanese,
                version: package.version,
                releaseNote: e.releaseNote,
                lp: package.lp,
              ),
            );
          }

          if (package.hasGooglePlayMetaData) {
            return package.googlePlayReleaseNotes.map(
              (e) => _build(
                appName: e.appName,
                isJapanese: e.isJapanese,
                version: package.version,
                releaseNote: e.releaseNote,
                lp: package.lp,
              ),
            );
          }

          return null;
        },
      )
      .whereNotNull()
      .flattened
      .toSet();

  for (final e in urlSet) {
    run(
      'open',
      arguments: [
        e,
      ],
    );
  }
}

String _build({
  required String appName,
  required bool isJapanese,
  required Version version,
  required File releaseNote,
  required Uri lp,
}) {
  final text = StringBuffer();

  if (isJapanese) {
    text.writeln(
      '【$appName バージョン$versionの配信を開始しました！】',
    );
  } else {
    text.writeln(
      '【$appName Version $version has been released!】',
    );
  }

  text
    ..writeln()
    ..writeln(releaseNote.readAsStringSync());

  return Uri(
    scheme: 'https',
    host: 'x.com',
    pathSegments: [
      'intent',
      'post',
    ],
    queryParameters: {
      'url': lp.toString(),
      'text': text.toString(),
    },
  ).toString();
}
