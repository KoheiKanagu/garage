import 'package:core/core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProviderContainer?> initialize() {
  return Future<ProviderContainer?>(
    _initialize,
  ).timeout(
    const Duration(seconds: 5),
    onTimeout: () async {
      failedRunApp();
      return null;
    },
  );
}

Future<ProviderContainer> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  final (_, sharedPreferences, packageInfo) = (
    await Firebase.initializeApp(),
    await SharedPreferences.getInstance(),
    await PackageInfo.fromPlatform(),
  );

  final container = ProviderContainer(
    observers: [
      ProviderLogger(),
    ],
    overrides: [
      sharedPreferencesInstanceProvider.overrideWithValue(
        sharedPreferences,
      ),
      packageInfoProvider.overrideWithValue(
        packageInfo,
      ),
    ],
  );

  /// error handling ---
  FlutterError.onError =
      container.read(firebaseCrashlyticsProvider).recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    container.read(firebaseCrashlyticsProvider).recordError(
          error,
          stack,
          fatal: true,
        );
    return true;
  };

  /// async initialization ---
  await Future.wait(
    [
      initBudouX(),
      container
          .read(firebaseCrashlyticsProvider)
          .setCrashlyticsCollectionEnabled(
            kReleaseMode,
          ),
      container.read(firebaseAnalyticsProvider).setAnalyticsCollectionEnabled(
            kReleaseMode,
          ),
      switch (kAppEnvDev) {
        true => FirebaseAppCheck.instance.activate(
            androidProvider: AndroidProvider.debug,
            appleProvider: AppleProvider.debug,
          ),
        false => FirebaseAppCheck.instance.activate(),
      },
    ],
  );

  /// listen Providers ---
  container.listen(
    firebaseUserUidProvider,
    (_, next) async {
      final uid = next.value;
      logger.i('listen firebaseUserUidProvider: $uid');

      await Future.wait(
        [
          container.read(firebaseAnalyticsProvider).setUserId(
                id: uid,
              ),
          container.read(firebaseCrashlyticsProvider).setUserIdentifier(
                uid ?? '',
              ),
        ],
      );
    },
  );

  return container;
}
