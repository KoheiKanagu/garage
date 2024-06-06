import 'dart:ui';

import 'package:flutter/foundation.dart';

class PreviewDevice {
  const PreviewDevice({
    required this.name,
    required this.pixelRatio,
    required this.size,
    required this.targetPlatform,
    required this.textScaleFactor,
    required this.brightness,
    required this.hasHomeBar,
  });

  factory PreviewDevice.iPhone6_7inch({
    double textScaleFactor = 1,
    Brightness brightness = Brightness.light,
  }) =>
      PreviewDevice(
        /// such as iPhone 15 Pro Max, iPhone 15 Plus
        /// https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications/
        name: 'iPhone 6.7 inch',
        pixelRatio: 3,
        size: const Size(1290, 2796) / 3,
        targetPlatform: TargetPlatform.iOS,
        textScaleFactor: textScaleFactor,
        brightness: brightness,
        hasHomeBar: true,
      );

  factory PreviewDevice.iPhone5_5inch({
    double textScaleFactor = 1,
    Brightness brightness = Brightness.light,
  }) =>
      PreviewDevice(
        /// such as iPhone 8 Plus
        /// https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications/
        name: 'iPhone 5.5 inch',
        pixelRatio: 3,
        size: const Size(1242, 2208) / 3,
        targetPlatform: TargetPlatform.iOS,
        textScaleFactor: textScaleFactor,
        brightness: brightness,
        hasHomeBar: false,
      );

  factory PreviewDevice.android6_7inch({
    double textScaleFactor = 1,
    Brightness brightness = Brightness.light,
  }) =>
      PreviewDevice(
        /// such as Pixel 8 Pro
        /// https://store.google.com/product/pixel_8_pro_specs
        name: 'Android 6.7 inch',
        pixelRatio: 3,
        size: const Size(1344, 2992) / 3,
        targetPlatform: TargetPlatform.android,
        textScaleFactor: textScaleFactor,
        brightness: brightness,
        hasHomeBar: true,
      );

  final String name;

  final double pixelRatio;

  final Size size;

  final TargetPlatform targetPlatform;

  final double textScaleFactor;

  final Brightness brightness;

  final bool hasHomeBar;

  PreviewDevice copyWith({
    String? name,
    double? pixelRatio,
    Size? size,
    TargetPlatform? targetPlatform,
    double? textScaleFactor,
    Brightness? brightness,
    bool? hasHomeBar,
  }) =>
      PreviewDevice(
        name: name ?? this.name,
        pixelRatio: pixelRatio ?? this.pixelRatio,
        size: size ?? this.size,
        targetPlatform: targetPlatform ?? this.targetPlatform,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        brightness: brightness ?? this.brightness,
        hasHomeBar: hasHomeBar ?? this.hasHomeBar,
      );
}
