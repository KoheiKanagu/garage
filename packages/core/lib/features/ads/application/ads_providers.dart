import 'dart:async';
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
        logger.debug(
          {
            'message': 'isConsentFormAvailable',
            'available': available,
          },
        );
        if (!available) {
          state = false;
          return;
        }

        final status = await ref.watch(adsConsentStatusProvider.future);
        state = switch (status) {
          ConsentStatus.required || ConsentStatus.unknown => true,
          ConsentStatus.notRequired || ConsentStatus.obtained => false,
        };
      },
      (error) => logger.handle(
        error,
        StackTrace.current,
        error.message,
      ),
    );
  }

  /// reference: https://developers.google.com/admob/flutter/eu-consent
  void loadForm() {
    reload();

    ConsentForm.loadConsentForm(
      (consentForm) async {
        final status = await ref.watch(adsConsentStatusProvider.future);
        if (status == ConsentStatus.required) {
          consentForm.show(
            (formError) {
              if (formError != null) {
                logger.handle(
                  formError,
                  StackTrace.current,
                  formError.message,
                );
              }
              loadForm();
            },
          );
        }
      },
      (formError) => logger.handle(
        formError,
        StackTrace.current,
        formError.message,
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

@riverpod
Future<BannerAd> adsBanner(
  AdsBannerRef ref, {
  required String adUnitId,
  required int width,
}) async {
  final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
    width,
  );

  if (size == null) {
    throw Exception('AdSize is null');
  }

  final loadCompleter = Completer<void>();

  final bannerAd = BannerAd(
    size: size,
    adUnitId: adUnitId,
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        logger.debug(
          {
            'responseInfo': ad.responseInfo,
            'adUnitId': ad.adUnitId,
          },
        );
        loadCompleter.complete();
      },
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        loadCompleter.completeError(
          {
            'ad': {
              'responseInfo': ad.responseInfo,
              'adUnitId': ad.adUnitId,
            },
            'error': {
              'code': error.code,
              'domain': error.domain,
              'message': error.message,
            },
          },
        );
      },
    ),
    request: const AdRequest(),
  );

  await bannerAd.load();
  await loadCompleter.future;

  return bannerAd;
}
