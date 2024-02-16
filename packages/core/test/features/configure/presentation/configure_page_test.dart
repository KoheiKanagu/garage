import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'ConfigurePage',
    widget: const ConfigurePage(
      additionalItems: [],
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: null,
  );
}
