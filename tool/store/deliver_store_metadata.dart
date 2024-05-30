import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Deliver store metadata',
)
Future<void> deliverStoreMetadata() async {
  final packages = await argumentScopes();

  for (final package in packages.values) {
    if (package.hasAppStoreMetaData) {
      run(
        'fastlane',
        arguments: [
          'deliver',
          '--skip_binary_upload',
          'true',
          '--skip_screenshots',
          'true',
          '--precheck_include_in_app_purchases',
          'false',
          '--automatic_release',
          'true',
          '--force',
          'true',
          '--app_identifier',
          package.iosBundleId,
          '--app_version',
          package.version.toString(),
          '--metadata_path',
          package.appStoreMetaDataDirectory.path,
        ],
      );
    }

    if (package.hasGooglePlayMetaData) {
      final result = run(
        'fastlane',
        arguments: [
          'run',
          'google_play_track_version_codes',
          'package_name:${package.androidPackageName}',
          'track:alpha',
        ],
      );

      // fastlaneの出力はjsonなどで取得できないので、正規表現で取得する
      final versionCode = RegExp(r'Result: \[(.+)\]')
          .firstMatch(result)!
          .group(1)!
          .split(', ')
          .map(int.parse)
          .max;

      run(
        'fastlane',
        arguments: [
          'supply',
          '--skip_upload_apk',
          'true',
          '--skip_upload_aab',
          'true',
          '--skip_upload_images',
          'true',
          '--skip_upload_screenshots',
          'true',
          '--metadata_path',
          package.googlePlayMetaDataDirectory.path,
          '--package_name',
          package.androidPackageName,
          '--track',
          'alpha',
          '--version_code',
          versionCode.toString(),
        ],
      );
    }
  }
}
