// ignore_for_file: avoid_dynamic_calls

import 'package:grinder/grinder.dart';

import 'grind.dart';
import 'utils.dart';

@Task(
  'Download app privacy details',
)
void downloadAppPrivacyDetails() {
  final package = argumentPackage();

  final bundleId = packages.firstWhere((e) => e.directory == package).bundleId;

  run(
    'fastlane',
    arguments: [
      'run',
      'download_app_privacy_details_from_app_store',
      'username:kanagu@kingu.dev',
      'team_id:121589329',
      'app_identifier:$bundleId',
      'output_json_path:packages/$package/.fastlane/app_privacy_details.json',
    ],
  );
}
