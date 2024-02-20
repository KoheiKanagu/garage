import 'package:core/gen/strings.g.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/permission_page.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/my_app.dart';

import '../../../../../core/test/core.dart';

void main() {
  goldenTestCombo(
    testName: 'PermissionPage denied',
    widget: const PermissionPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: MyApp.theme,
    materialThemeData: null,
    providerOverrides: [
      locationManagerCurrentPermissionStatusStreamProvider.overrideWith(
        (ref) => Stream.value(AuthorizationStatus.denied),
      ),
      musicKitCurrentPermissionStatusProvider.overrideWith(
        (ref) => MusicAuthorizationStatus.denied,
      ),
    ],
  );

  goldenTestCombo(
    testName: 'PermissionPage authorized',
    widget: const PermissionPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: MyApp.theme,
    materialThemeData: null,
    providerOverrides: [
      locationManagerCurrentPermissionStatusStreamProvider.overrideWith(
        (ref) => Stream.value(AuthorizationStatus.authorizedAlways),
      ),
      musicKitCurrentPermissionStatusProvider.overrideWith(
        (ref) => MusicAuthorizationStatus.authorized,
      ),
    ],
  );
}
