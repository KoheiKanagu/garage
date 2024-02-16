import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'UpdateAppPageHome not forced',
    widget: const UpdateAppPageHome(
      force: false,
      noAppIconImage: true,
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [
      packageInfoAppNameProvider.overrideWithValue('App Name'),
      packageInfoInstallerStoreProvider.overrideWithValue('Store'),
    ],
  );

  goldenTestCombo(
    testName: 'UpdateAppPageHome forced',
    widget: const UpdateAppPageHome(
      force: true,
      noAppIconImage: true,
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [
      packageInfoAppNameProvider.overrideWithValue('App Name'),
      packageInfoInstallerStoreProvider.overrideWithValue('Store'),
    ],
  );
}
