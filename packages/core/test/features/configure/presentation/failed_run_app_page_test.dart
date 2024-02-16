import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'FailedRunAppPageHome',
    widget: const FailedRunAppPageHome(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
  );
}
