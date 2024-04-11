import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

void main() {
  goldenTestCombo(
    testName: 'UserInfoPage',
    widget: const UserInfoPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [
      firebaseUserUidProvider.overrideWith(
        (_) => 'uid',
      ),
      firebaseUserLinkedProvidersProvider.overrideWith(
        (ref) => [],
      ),
    ],
  );

  goldenTestCombo(
    testName: 'UserInfoPage Linked',
    widget: const UserInfoPage(),
    supportedLocales: AppLocaleUtils.supportedLocales,
    cupertinoThemeData: const CupertinoThemeData(),
    materialThemeData: ThemeData(),
    providerOverrides: [
      firebaseUserUidProvider.overrideWith(
        (_) => 'uid',
      ),
      firebaseUserLinkedProvidersProvider.overrideWith(
        (ref) => MyAuthProviderType.values.map((e) => e.providerId).toList(),
      ),
    ],
  );
}
