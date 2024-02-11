// ignore_for_file: comment_references

import 'package:core/core.dart';
import 'package:core/features/ads/application/ads_providers.dart';
import 'package:core/gen/strings.g.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initialize the app.
///
/// [firebaseOptions] is the Firebase options.
///
/// [overrides] is the list of Providers to override.
///
/// [bannerAdUnitId] is the AdMob banner ad unit ID.
/// If not specified, the test ad unit ID will be used.
Future<ProviderContainer?> initialize({
  required FirebaseOptions firebaseOptions,
  List<Override>? overrides,
  String? bannerAdUnitId,
}) {
  WidgetsFlutterBinding.ensureInitialized();

  final locale = LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = locale.languageCode;

  /// AdMob
  if (bannerAdUnitId != null) {
    kBannerAdUnitId = bannerAdUnitId;
  } else {
    if (kAppEnvProd) {
      logger.warning(
        '${AppEnv.prod} is selected, but it is a test ad unit id.',
      );
    }
    kBannerAdUnitId = kBannerAdUnitIdTest;
  }

  return Future<ProviderContainer?>(
    () => _initialize(
      overrides: overrides ?? [],
      options: firebaseOptions,
    ),
  ).timeout(
    const Duration(seconds: 10),
    onTimeout: () async {
      runApp(
        const ProviderScope(
          child: FailedRunAppPage(),
        ),
      );
      return null;
    },
  );
}

Future<ProviderContainer> _initialize({
  required List<Override> overrides,
  required FirebaseOptions options,
}) async {
  final (firebaseApp, sharedPreferences, packageInfo, adsStatus) = (
    await Firebase.initializeApp(
      options: options,
    ),
    await SharedPreferences.getInstance(),
    await PackageInfo.fromPlatform(),
    await MobileAds.instance.initialize(),
  );

  logger.fine(adsStatus.adapterStatuses);

  FirebaseUIAuth.configureProviders(
    firebaseUIAuthProviders,
    app: firebaseApp,
  );

  final container = ProviderContainer(
    observers: [
      ProviderLogger(),
    ],
    overrides: [
      ...overrides,
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
      if (kAppEnvDev)
        FirebaseAppCheck.instance.activate(
          androidProvider: AndroidProvider.debug,
          appleProvider: AppleProvider.debug,
        ),
      if (kAppEnvProd)
        FirebaseAppCheck.instance.activate(
          appleProvider: AppleProvider.appAttest,
        ),
      const QuickActions().setShortcutItems(
        [
          ShortcutItem(
            type: kFeedbackShortcut,
            localizedTitle: i18n.feedback.please_feedback,
          ),
        ],
      ),
    ],
  );

  /// listen Providers ---
  container
    ..listen(
      firebaseUserUidProvider,
      (_, next) async {
        final uid = next.value;
        logger.info('listen firebaseUserUidProvider: $uid');

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
    )
    ..listen(
      remoteConfigValuesProvider,
      (_, __) {
        // disposeされるのを防ぐ
      },
    );

  return container;
}
