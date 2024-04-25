import 'package:grinder/grinder.dart';

import 'grind.dart';
import 'utils.dart';

@Task(
  'Upload to Play Store',
)
void uploadToPlayStore() {
  final package = argumentPackage();

  final packageName = packages
      .firstWhere(
        (e) => e.directory == package,
      )
      .packageName;

  run(
    'fastlane',
    arguments: [
      'supply',
      '--package_name',
      packageName,
      '--aab',
      'packages/$package/build/app/outputs/bundle/prodRelease/app-prod-release.aab',
      '--skip_upload_apk',
      'true',
      '--skip_upload_metadata',
      'true',
      '--skip_upload_changelogs',
      'true',
      '--skip_upload_images',
      'true',
      '--skip_upload_screenshots',
      'true',
      '--release_status',
      'draft',
      '--track',
      'alpha',
    ],
  );
}
