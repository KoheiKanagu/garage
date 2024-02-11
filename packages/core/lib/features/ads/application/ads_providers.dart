import 'dart:io';

/// "https://developers.google.com/admob/flutter/banner?hl=ja#always_test_with_test_ads"
final kBannerAdUnitIdTest = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : 'ca-app-pub-3940256099942544/2934735716';

late final String kBannerAdUnitId;
