import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'ConfigurePage',
    widget: const ConfigurePage(
      additionalItems: [],
      enableDebugItems: false,
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
  );

  goldenTestCombo(
    testName: 'ConfigurePage with additionalItems',
    widget: ConfigurePage(
      additionalItems: [
        ConfigureItem(
          text: 'Rocket',
          onTap: () {},
          leadingIcon: CupertinoIcons.rocket_fill,
          forDebug: false,
        ),
      ],
      enableDebugItems: false,
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
  );
}
