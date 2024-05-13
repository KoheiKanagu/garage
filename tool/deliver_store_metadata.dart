import 'dart:io';

import 'package:grinder/grinder.dart';

import 'utils.dart';

@Task(
  'Deliver store metadata',
)
void deliverStoreMetadata() {
  final packages = argumentPackages();

  for (final package in packages) {
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
          '--force',
          'true',
          '--app_identifier',
          getIosBundleId(package),
          // '--app_version',
          // version.toStringNoBuildNumber(),
        ],
        workingDirectory: 'packages/$package',
      );
    }

    final googlePlay =
        Directory('packages/$package/.fastlane/metadata/android').existsSync();
    if (googlePlay) {
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
          // '--version_code',
          // // このバージョンのリリースが存在している必要がある
          // version.build.toString(),
        ],
        workingDirectory: 'packages/$package',
      );
    }
  }
}
