import 'dart:io';

import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Deliver store metadata',
)
Future<void> deliverStoreMetadata() async {
  final packages = argumentPackages();

  for (final package in packages) {
    final version = await currentVersion(package);

    final appStore =
        Directory('packages/$package/.fastlane/metadata/default').existsSync();
    if (appStore) {
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
          getIosBundleId(package),
          '--app_version',
          version.toString(),
        ],
        workingDirectory: 'packages/$package',
      );
    }

    final googlePlay =
        Directory('packages/$package/.fastlane/metadata/android').existsSync();
    if (googlePlay) {
      final result = run(
        'fastlane',
        arguments: [
          'run',
          'google_play_track_version_codes',
          'package_name:${getAndroidPackageName(package)}',
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
          '.fastlane/metadata/android',
          '--package_name',
          getAndroidPackageName(package),
          '--track',
          'alpha',
          '--version_code',
          versionCode.toString(),
        ],
        workingDirectory: 'packages/$package',
      );
    }
  }
}
