import 'dart:convert';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:core/extensions/cupertino_text_theme_data_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@isTest
void goldenTestCombo({
  required String testName,
  required Widget widget,
  required List<Locale> supportedLocales,
  required List<LocalizationsDelegate<dynamic>>? localizationsDelegates,
  required CupertinoThemeData? cupertinoThemeData,
  required ThemeData? materialThemeData,
  Future<void> Function(
    ProviderContainer container,
  )? beforeTest,
  Clock? fixedClock,
  List<double> textScaleFactors = const [0.75, 1.0, 1.25, 1.5],
  bool skip = false,
  List<Override> providerOverrides = const [],
  List<TestDeviceSize> devices = TestDeviceSize.values,
}) {
  assert(
    cupertinoThemeData != null || materialThemeData != null,
    'You must specify one of cupertinoThemeData or materialThemeData',
  );

  final hostPlatforms = [
    'ci',
    if (Platform.isMacOS || Platform.isWindows) Platform.operatingSystem,
  ];

  for (final hostPlatform in hostPlatforms) {
    final ciPlatform = hostPlatform == 'ci';

    for (final device in TestDeviceSize.values) {
      for (final textScaleFactor in textScaleFactors) {
        for (final locale in supportedLocales) {
          final name = '$testName.${device.name}_x${textScaleFactor}_$locale';

          testWidgets(
            name,
            (tester) async {
              await defaultLoadAppFonts();

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

              /// theme
              dynamic theme;
              if (ciPlatform) {
                // Use Ahem font for CI
                if (cupertinoThemeData != null) {
                  theme = cupertinoThemeData.copyWith(
                    textTheme: cupertinoThemeData.textTheme.apply(
                      fontFamily: 'Ahem',
                    ),
                  );
                } else if (materialThemeData != null) {
                  theme = materialThemeData.copyWith(
                    textTheme: materialThemeData.textTheme.apply(
                      fontFamily: 'Ahem',
                    ),
                  );
                }
              } else {
                theme = cupertinoThemeData ?? materialThemeData;
              }
              final themeType = cupertinoThemeData != null
                  ? InheritedThemeType.cupertino
                  : InheritedThemeType.material;

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
                    localizationsDelegates: localizationsDelegates,
                    theme: theme as CupertinoThemeData,
                    home: home,
                  ),
                InheritedThemeType.material => MaterialApp(
                    key: rootKey,
                    debugShowCheckedModeBanner: false,
                    supportedLocales: supportedLocales,
                    localizationsDelegates: localizationsDelegates,
                    theme: theme as ThemeData,
                    home: home,
                  ),
              };

              await tester.runAsync(
                () async {
                  /// real shadows
                  debugDisableShadows = ciPlatform;

                  await withClock(
                    fixedClock ?? const Clock(),
                    () async {
                      await tester.pumpWidget(target);
                      await precacheImages(tester);
                    },
                  );

                  debugDisableShadows = true;
                },
              );

              await expectLater(
                find.byKey(rootKey),
                matchesGoldenFile(
                  'goldens/$hostPlatform/$name.png',
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

@visibleForTesting
Future<void> defaultLoadAppFonts() async {
  final fontManifest = await rootBundle.loadStructuredData(
    'FontManifest.json',
    (string) async => json.decode(string) as Iterable<dynamic>,
  );

  for (final e in fontManifest) {
    final family = (e as Map<String, dynamic>)['family'] as String;
    final loader = FontLoader(
      family.replaceAll(RegExp(r'packages\/[^\/]*\/'), ''),
    );

    for (final f in e['fonts'] as List<dynamic>) {
      loader.addFont(
        rootBundle.load((f as Map<String, dynamic>)['asset'] as String),
      );
    }
    await loader.load();
  }
}
