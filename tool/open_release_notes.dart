import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as p;

import 'utils.dart';

@Task(
  'Open release notes text files in text editor',
)
Future<void> openReleaseNotes() async {
  final packages = await argumentScopes();

  final paths = packages.values.map(
    (package) {
      final results = <String>[];

      if (package.hasAppStoreMetaData) {
        results.addAll(
          ['ja', 'en-US'].map(
            (locale) => p.join(
              package.appStoreMetaDataDirectory.path,
              locale,
              'release_notes.txt',
            ),
          ),
        );
      }

      if (package.hasGooglePlayMetaData) {
        results.addAll(
          ['ja-JP', 'en-US'].map(
            (locale) => p.join(
              package.googlePlayMetaDataDirectory.path,
              locale,
              'changelogs',
              'default.txt',
            ),
          ),
        );
      }

      return results;
    },
  ).expand(
    (e) => e,
  );

  for (final path in paths) {
    run(
      'open',
      arguments: [
        path,
      ],
    );
  }
}
