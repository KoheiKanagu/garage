import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/constants/firebase_options_dev.dart';
import 'package:obento/my_app.dart';

Future<void> main() async {
  kTenantId = 'obento-44oe4';
  // TODO: Replace with your own app store ID
  kAppStoreId = 'TODO';
  kBannerAdUnitId = kBannerAdUnitIdTest;

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  if (container != null) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  }
}
