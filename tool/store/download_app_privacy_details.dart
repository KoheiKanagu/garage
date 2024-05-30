// ignore_for_file: avoid_dynamic_calls

import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Download app privacy details',
)
Future<void> downloadAppPrivacyDetails() async {
  final package = await argumentScopes().then(
    (v) => v.values.single,
  );

  run(
    'fastlane',
    arguments: [
      'run',
      'download_app_privacy_details_from_app_store',
      'username:kanagu@kingu.dev',
      'team_id:121589329',
      'app_identifier:${package.iosBundleId}',
      'output_json_path:packages/${package.name}/.fastlane/app_privacy_details.json',
    ],
  );
}
