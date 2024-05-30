import 'package:grinder/grinder.dart';

import 'utils.dart';

const String email = 'kohei.kanagu@gmail.com';

const String projectNameDev = 'kingu-garage-dev';
const String projectNameProd = 'kingu-garage-prod';

@Task(
  'FlutterFire configure',
)
Future<void> flutterfireConfigure() async {
  final packages = await argumentScopes();

  for (final e in packages.values) {
    for (final buildConfig in ['Debug-dev', 'Release-dev', 'Profile-dev']) {
      run(
        'flutterfire',
        arguments: [
          'configure',
          '--project',
          projectNameDev,
          '--account',
          email,
          '--out',
          'lib/constants/firebase_options_dev.dart',
          '--yes',
          '--ios-bundle-id',
          '${e.iosBundleId}.dev',
          '--ios-build-config',
          buildConfig,
          '--ios-out',
          'ios/dev/GoogleService-Info.plist',
          '--android-package-name',
          '${e.androidPackageName}.dev',
          '--android-out',
          'android/app/src/dev/google-services.json',
        ],
        workingDirectory: e.path,
      );
    }

    for (final buildConfig in ['Debug-prod', 'Release-prod', 'Profile-prod']) {
      run(
        'flutterfire',
        arguments: [
          'configure',
          '--project',
          projectNameProd,
          '--account',
          email,
          '--out',
          'lib/constants/firebase_options_prod.dart',
          '--yes',
          '--ios-bundle-id',
          e.iosBundleId,
          '--ios-build-config',
          buildConfig,
          '--ios-out',
          'ios/prod/GoogleService-Info.plist',
          '--android-package-name',
          e.androidPackageName,
          '--android-out',
          'android/app/src/prod/google-services.json',
        ],
        workingDirectory: e.path,
      );
    }
  }
}
