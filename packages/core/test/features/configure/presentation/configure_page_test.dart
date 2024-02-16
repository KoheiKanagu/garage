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
    // TODO
    devices: [
      TestDeviceSize.iPhone_6_7inch,
    ],
    // TODO
    textScaleFactors: [1.0],
  );
}
