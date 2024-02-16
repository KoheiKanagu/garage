import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'ServiceDownPage',
    widget: const ServiceDownPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
  );
}
