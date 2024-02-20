import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'AboutThisAppPage',
    widget: const AboutThisAppPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
  );

  goldenTestCombo(
    testName: 'AboutThisAppPage with ads consent',
    widget: const AboutThisAppPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [
      adsConsentStatusProvider.overrideWith(
        (ref) => ConsentStatus.obtained,
      ),
    ],
  );
}
