import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/test/core.dart';

void main() {
  goldenTestCombo(
    testName: 'example',
    widget: Container(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [],
    skip: true,
  );
}
