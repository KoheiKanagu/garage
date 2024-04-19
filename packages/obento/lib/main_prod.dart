import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/constants/firebase_options_prod.dart';
import 'package:obento/my_app.dart';

Future<void> main() async {
  kTenantId = 'obento-xfha1';

  // TODO: Replace with your own app store ID
  kAppStoreId = 'TODO';

  // TODO: Replace with your own ad unit ID
  kBannerAdUnitId = 'TODO';

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
