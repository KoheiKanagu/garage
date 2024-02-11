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

/// トラッキングをリクエストするべきかどうか
@riverpod
class AdsRequestConsentInfoUpdateController
    extends _$AdsRequestConsentInfoUpdateController {
  @override
  bool build() {
    reload();

    return false;
  }

  /// トラッキングをリクエストするべきかどうかを再読み込みする
  void reload() {
    ref.invalidate(adsConsentStatusProvider);

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
        logger.fine('isConsentFormAvailable: $available');
        if (!available) {
          state = false;
          return;
        }

        final status = await ref.read(adsConsentStatusProvider.future);
        state = switch (status) {
          ConsentStatus.required || ConsentStatus.unknown => true,
          ConsentStatus.notRequired || ConsentStatus.obtained => false,
        };
      },
      (error) => logger.severe(
        {
          'errorCode': error.errorCode,
          'message': error.message,
        },
      ),
    );
  }

  /// reference: https://developers.google.com/admob/flutter/eu-consent
  void loadForm() {
    reload();

    ConsentForm.loadConsentForm(
      (consentForm) async {
        final status = await ref.read(adsConsentStatusProvider.future);
        if (status == ConsentStatus.required) {
          consentForm.show(
            (formError) {
              if (formError != null) {
                logger.severe(
                  {
                    'errorCode': formError.errorCode,
                    'message': formError.message,
                  },
                );
              }
              loadForm();
            },
          );
        }
      },
      (formError) => logger.severe(
        {
          'errorCode': formError.errorCode,
          'message': formError.message,
        },
      ),
    );
  }

  Future<void> reset() async {
    await ConsentInformation.instance.reset();
    ref
      ..invalidate(adsConsentStatusProvider)
      ..invalidateSelf();
  }
}

@riverpod
Future<ConsentStatus> adsConsentStatus(
  AdsConsentStatusRef ref,
) =>
    ConsentInformation.instance.getConsentStatus();
