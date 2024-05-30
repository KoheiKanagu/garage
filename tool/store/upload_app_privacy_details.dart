import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Upload app privacy details',
)
Future<void> uploadAppPrivacyDetails() async {
  final package = await argumentScopes().then(
    (v) => v.values.single,
  );

  final noAds = context.invocation.arguments.getFlag('noAds');

  run(
    'fastlane',
    arguments: [
      'run',
      'upload_app_privacy_details_to_app_store',
      'username:kanagu@kingu.dev',
      'team_id:121589329',
      'app_identifier:${package.iosBundleId}',
      if (noAds)
        'json_path:tool/assets/app_privacy_details_no_ads.json'
      else
        'json_path:packages/${package.name}/.fastlane/app_privacy_details.json',
    ],
  );
}
