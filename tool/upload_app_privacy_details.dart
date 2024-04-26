import 'package:grinder/grinder.dart';

import 'flutterfire_configure.dart';
import 'utils.dart';

@Task(
  'Upload app privacy details',
)
void uploadAppPrivacyDetails() {
  final package = argumentPackage();

  final bundleId = packages.firstWhere((e) => e.directory == package).bundleId;

  run(
    'fastlane',
    arguments: [
      'run',
      'upload_app_privacy_details_to_app_store',
      'username:kanagu@kingu.dev',
      'team_id:121589329',
      'app_identifier:$bundleId',
      'json_path:packages/$package/.fastlane/app_privacy_details.json',
    ],
  );
}
