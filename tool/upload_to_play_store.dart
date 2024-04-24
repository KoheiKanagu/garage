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
    ],
  );
}
