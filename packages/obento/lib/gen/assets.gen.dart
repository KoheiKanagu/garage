/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.webp
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.webp');

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// List of all assets
  List<AssetGenImage> get values => [appIcon];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/screenshot_0.webp
  AssetGenImage get screenshot0 =>
      const AssetGenImage('assets/images/onboarding/screenshot_0.webp');

  /// File path: assets/images/onboarding/screenshot_1.webp
  AssetGenImage get screenshot1 =>
      const AssetGenImage('assets/images/onboarding/screenshot_1.webp');

  /// File path: assets/images/onboarding/screenshot_2.webp
  AssetGenImage get screenshot2 =>
      const AssetGenImage('assets/images/onboarding/screenshot_2.webp');

  /// File path: assets/images/onboarding/screenshot_3.webp
  AssetGenImage get screenshot3 =>
      const AssetGenImage('assets/images/onboarding/screenshot_3.webp');

  /// File path: assets/images/onboarding/screenshot_4.webp
  AssetGenImage get screenshot4 =>
      const AssetGenImage('assets/images/onboarding/screenshot_4.webp');

  /// File path: assets/images/onboarding/screenshot_5.webp
  AssetGenImage get screenshot5 =>
      const AssetGenImage('assets/images/onboarding/screenshot_5.webp');

  /// File path: assets/images/onboarding/screenshot_6.webp
  AssetGenImage get screenshot6 =>
      const AssetGenImage('assets/images/onboarding/screenshot_6.webp');

  /// File path: assets/images/onboarding/screenshot_7.webp
  AssetGenImage get screenshot7 =>
      const AssetGenImage('assets/images/onboarding/screenshot_7.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        screenshot0,
        screenshot1,
        screenshot2,
        screenshot3,
        screenshot4,
        screenshot5,
        screenshot6,
        screenshot7
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
