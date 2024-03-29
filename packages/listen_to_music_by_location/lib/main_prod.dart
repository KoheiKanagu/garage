import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/constants/firebase_options_prod.dart';
import 'package:listen_to_music_by_location/my_app.dart';

Future<void> main() async {
  kTenantId = 'loca-music-58i3e';
  kAppStoreId = '6471416156';
  kBannerAdUnitId = 'ca-app-pub-3095994149570460/7585926453';

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
