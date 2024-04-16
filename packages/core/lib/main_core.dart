// ignore_for_file: comment_references

import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
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
Future<ProviderContainer?> initialize({
  required FirebaseOptions firebaseOptions,
  List<Override>? overrides,
}) {
  WidgetsFlutterBinding.ensureInitialized();

  final locale = LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = locale.languageCode;

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
  final (_, sharedPreferences, packageInfo, adsStatus) = (
    await Firebase.initializeApp(
      options: options,
    ),
    await SharedPreferences.getInstance(),
    await PackageInfo.fromPlatform(),
    await MobileAds.instance.initialize(),
  );

  logger.debug(
    {
      'message': 'MobileAds initialized',
      'value': adsStatus.adapterStatuses.entries.map(
        (e) => {
          'key': e.key,
          'value': {
            'state': e.value.state,
            'description': e.value.description,
            'latency': e.value.latency,
          },
        },
      ),
    },
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
    )
    ..listen(
      serviceStatusProvider,
      (_, __) {
        // disposeされるのを防ぐ
      },
    );

  return container;
}
