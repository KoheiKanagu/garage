import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Open release notes text files in text editor',
)
Future<void> openReleaseNotes() async {
  final packages = await argumentScopes();

  for (final package in packages.values) {
    // App Store
    if (package.hasAppStoreMetaData) {
      for (final e in package.appStoreReleaseNotes) {
        run(
          'open',
          arguments: [
            e.releaseNote.path,
          ],
        );
      }
    }

    // Google Play Store
    if (package.hasGooglePlayMetaData) {
      for (final e in package.googlePlayReleaseNotes) {
        run(
          'open',
          arguments: [
            e.releaseNote.path,
          ],
        );
      }
    }
  }
}
