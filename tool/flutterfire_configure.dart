import 'package:grinder/grinder.dart';

final packages = [
  (
    directory: 'listen_to_music_by_location',
    bundleId: 'dev.kingu.listenToMusicByLocation',
    packageName: 'dev.kingu.listen_to_music_by_location',
  ),
  // (
  //   directory: 'TODO',
  //   bundleId: 'dev.kingu.TODO',
  //   packageName: 'dev.kingu.TODO',
  // ),
];

const String email = 'kohei.kanagu@gmail.com';

const String projectNameDev = 'kingu-garage-dev';
const String projectNameProd = 'kingu-garage-prod';

@Task(
  'FlutterFire configure',
)
void flutterfireConfigure() {
  for (final e in packages) {
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
          '${e.bundleId}.dev',
          '--ios-build-config',
          buildConfig,
          '--ios-out',
          'ios/dev/GoogleService-Info.plist',
          '--android-package-name',
          '${e.packageName}.dev',
          '--android-out',
          'android/app/src/dev/google-services.json',
        ],
        workingDirectory: 'packages/${e.directory}',
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
          e.bundleId,
          '--ios-build-config',
          buildConfig,
          '--ios-out',
          'ios/prod/GoogleService-Info.plist',
          '--android-package-name',
          e.packageName,
          '--android-out',
          'android/app/src/prod/google-services.json',
        ],
        workingDirectory: 'packages/${e.directory}',
      );
    }
  }
}
