// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:io';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final defaultLocalizationsDelegates = [
  GlobalCupertinoLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];

@isTest
void goldenTestCombo({
  required String testName,
  required Widget widget,
  required List<Locale> supportedLocales,
  required CupertinoThemeData? cupertinoThemeData,
  required ThemeData? materialThemeData,
  List<LocalizationsDelegate<dynamic>>? localizationsDelegates,
  Future<void> Function(
    ProviderContainer container,
  )? beforeTest,
  Clock? fixedClock,
  List<double> textScaleFactors = const [0.75, 1.0, 1.25, 1.5],
  bool skip = false,
  List<Override> providerOverrides = const [],
  List<TestDeviceSize> devices = TestDeviceSize.values,
  bool realShadows = false,
}) {
  assert(
    cupertinoThemeData != null || materialThemeData != null,
    'Please specify either cupertinoThemeData or materialThemeData, or both.',
  );

  final hostPlatform = Platform.operatingSystem;

  for (final device in devices) {
    for (final textScaleFactor in textScaleFactors) {
      for (final locale in supportedLocales) {
        for (final themeType in InheritedThemeType.values) {
          switch (themeType) {
            case InheritedThemeType.cupertino:
              if (cupertinoThemeData == null) {
                continue;
              }
            case InheritedThemeType.material:
              if (materialThemeData == null) {
                continue;
              }
          }

          final name =
              '$testName.${themeType.name}_${device.name}_x${textScaleFactor}_$locale';

          testWidgets(
            name,
            (tester) async {
              /// Locale settings
              LocaleSettings.setLocaleRaw(locale.toLanguageTag());
              Intl.defaultLocale = locale.languageCode;

              /// Device surface size
              await tester.binding.setSurfaceSize(device.size);
              addTearDown(
                () => tester.binding.setSurfaceSize(null),
              );

              /// Device pixel ratio
              tester.view.devicePixelRatio = 1.0;
              addTearDown(
                tester.view.resetDevicePixelRatio,
              );

              /// riverpod
              final container = ProviderContainer(
                overrides: providerOverrides,
              );
              addTearDown(
                container.dispose,
              );
              await beforeTest?.call(container);

              final theme = switch (themeType) {
                InheritedThemeType.cupertino => cupertinoThemeData?.copyWith(
                    textTheme: cupertinoThemeData.textTheme.apply(
                      // By default, it uses CupertinoSystemText or CupertinoSystemDisplay,
                      // but they are not available for testing, so we change it to NotoSansJP.
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                InheritedThemeType.material => materialThemeData?.copyWith(
                    textTheme: materialThemeData.textTheme.apply(
                      // By default, it uses Roboto, but it does not contain Japanese, so we change it to NotoSansJP.
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
              };

              /// test target widget
              final home = Builder(
                builder: (context) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(textScaleFactor),
                    size: device.size,
                  ),
                  child: UncontrolledProviderScope(
                    container: container,
                    child: widget,
                  ),
                ),
              );
              final rootKey = UniqueKey();
              final target = switch (themeType) {
                InheritedThemeType.cupertino => CupertinoApp(
                    key: rootKey,
                    debugShowCheckedModeBanner: false,
                    supportedLocales: supportedLocales,
                    locale: locale,
                    localizationsDelegates:
                        localizationsDelegates ?? defaultLocalizationsDelegates,
                    theme: theme! as CupertinoThemeData,
                    home: home,
                  ),
                InheritedThemeType.material => MaterialApp(
                    key: rootKey,
                    debugShowCheckedModeBanner: false,
                    supportedLocales: supportedLocales,
                    locale: locale,
                    localizationsDelegates:
                        localizationsDelegates ?? defaultLocalizationsDelegates,
                    theme: theme! as ThemeData,
                    home: home,
                  ),
              };

              await tester.runAsync(
                () async {
                  /// real shadows
                  debugDisableShadows = !realShadows;

                  await withClock(
                    fixedClock ?? const Clock(),
                    () async {
                      await tester.pumpWidget(target);
                      await precacheImages(tester);
                    },
                  );

                  // required reset
                  debugDisableShadows = true;
                },
              );

              await expectLater(
                find.byKey(rootKey),
                matchesGoldenFile(
                  'goldens/$hostPlatform/$testName/$name.png',
                ),
              );
            },
            tags: ['golden'],
            skip: skip,
          );
        }
      }
    }
  }
}

Future<void> precacheImages(WidgetTester tester) async {
  await Future.wait(
    [
      ...find.byType(Image).evaluate().map(
            (e) => precacheImage((e.widget as Image).image, e),
          ),
      ...find.byType(FadeInImage).evaluate().map(
            (e) => precacheImage((e.widget as FadeInImage).image, e),
          ),
      ...find.byType(DecoratedBox).evaluate().map(
        (e) async {
          final decoration = (e.widget as DecoratedBox).decoration;
          if (decoration is BoxDecoration) {
            final image = decoration.image?.image;
            if (image != null) {
              return precacheImage(image, e);
            }
          }
        },
      ),
    ],
  );

  await tester.pumpAndSettle();
}

@visibleForTesting
enum TestDeviceSize {
  /// such as iPhone 15 Pro Max, iPhone 15 Plus
  /// https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications/
  iPhone_6_7inch,

  /// such as iPhone 8 Plus
  /// https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications/
  iPhone_5_5inch,

  /// such as Pixel 8 Pro
  /// https://store.google.com/product/pixel_8_pro_specs
  Android_20_9inch, // ignore: constant_identifier_names
  ;

  double get pixelRatio => switch (this) {
        TestDeviceSize.iPhone_6_7inch => 3,
        TestDeviceSize.iPhone_5_5inch => 3,
        TestDeviceSize.Android_20_9inch => 3,
      };

  Size get size => switch (this) {
        TestDeviceSize.iPhone_6_7inch => const Size(1290, 2796) / pixelRatio,
        TestDeviceSize.iPhone_5_5inch => const Size(1242, 2208) / pixelRatio,
        TestDeviceSize.Android_20_9inch => const Size(1344, 2992) / pixelRatio,
      };

  TargetPlatform get targetPlatform => switch (this) {
        TestDeviceSize.iPhone_6_7inch ||
        TestDeviceSize.iPhone_5_5inch =>
          TargetPlatform.iOS,
        TestDeviceSize.Android_20_9inch => TargetPlatform.android,
      };
}
