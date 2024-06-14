import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/constants/firebase_options_prod.dart';
import 'package:obento/my_app.dart';

Future<void> main() async {
  kTenantId = 'obento-xfha1';
  kAppStoreId = '6499041461';
  kBannerAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3095994149570460/9683643581'
      : 'ca-app-pub-3095994149570460/6342314310';

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  if (container != null) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: MyApp(
          targetPlatform:
              Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
          navigatorKey: GlobalKey<NavigatorState>(),
        ),
      ),
    );
  }
}
