import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'golden_test_combo.dart';

@isTest
void featureGraphic({
  required Image appIcon,
  required Color base,
  required Color baseDark,
}) {
  final values = [
    (
      size: const Size(1024, 500),
      description: 'Feature Graphic',
      out: 'feature-graphic.png',
    ),
    (
      size: const Size(1200, 630),
      description: 'OGP',
      out: 'ogp.png',
    ),
  ];

  for (final e in values) {
    testWidgets(
      e.description,
      (tester) async {
        await tester.binding.setSurfaceSize(e.size);
        addTearDown(
          () => tester.binding.setSurfaceSize(null),
        );

        tester.view.devicePixelRatio = 1.0;
        addTearDown(
          tester.view.resetDevicePixelRatio,
        );

        final rootKey = UniqueKey();

        final widget = Container(
          key: rootKey,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                base,
                baseDark,
              ],
            ),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(64),
              child: SizedBox.square(
                dimension: e.size.width / 3,
                child: appIcon,
              ),
            ),
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(widget);
          await precacheImages(tester);
        });

        await expectLater(
          find.byKey(rootKey),
          matchesGoldenFile(e.out),
        );
      },
      tags: ['golden'],
    );
  }
}
