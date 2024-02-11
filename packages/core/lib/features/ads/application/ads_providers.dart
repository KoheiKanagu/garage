import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ads_providers.g.dart';

/// "https://developers.google.com/admob/flutter/banner?hl=ja#always_test_with_test_ads"
final kBannerAdUnitIdTest = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : 'ca-app-pub-3940256099942544/2934735716';

late final String kBannerAdUnitId;

/// request consent info update
@riverpod
Future<void> adsRequestConsentInfoUpdate(
  AdsRequestConsentInfoUpdateRef ref,
) async {
  final params = ConsentRequestParameters(
    consentDebugSettings: ConsentDebugSettings(
      debugGeography: kDebugMode
          ? DebugGeography.debugGeographyEea
          : DebugGeography.debugGeographyDisabled,
    ),
  );
  ConsentInformation.instance.requestConsentInfoUpdate(
    params,
    () async {
      final available =
          await ConsentInformation.instance.isConsentFormAvailable();
      if (available) {
        _loadForm();
      }
    },
    (error) => logger.severe(
      'Failed to request consent info update: $error',
    ),
  );
}

@riverpod
Future<ConsentStatus> adsConsentStatus(
  AdsConsentStatusRef ref,
) =>
    ConsentInformation.instance.getConsentStatus();

@riverpod
Future<void> adsResetConsentStatus(
  AdsResetConsentStatusRef ref,
) async {
  await ConsentInformation.instance.reset();
  await ref
      .read(sharedPreferencesControllerProvider.notifier)
      .setRequestAdsConsentInfoUpdate(
        value: true,
      );
  ref.invalidate(adsConsentStatusProvider);
}

void _loadForm() {
  ConsentForm.loadConsentForm(
    (consentForm) async {
      final status = await ConsentInformation.instance.getConsentStatus();

      if (status == ConsentStatus.required) {
        consentForm.show(
          (formError) {
            if (formError != null) {
              logger.severe(
                'Failed to show consent form: $formError',
              );
              _loadForm();
            }
          },
        );
      }
    },
    (formError) => logger.severe(
      'Failed to load consent form: $formError',
    ),
  );
}
