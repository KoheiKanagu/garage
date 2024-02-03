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

  $AssetsImagesHowToGen get howTo => const $AssetsImagesHowToGen();
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// List of all assets
  List<AssetGenImage> get values => [appIcon];
}

class $AssetsSiGen {
  const $AssetsSiGen();

  /// File path: assets/si/apple_music_badge_en.si
  String get appleMusicBadgeEn => 'assets/si/apple_music_badge_en.si';

  /// File path: assets/si/apple_music_badge_ja.si
  String get appleMusicBadgeJa => 'assets/si/apple_music_badge_ja.si';

  /// File path: assets/si/apple_music_icon.si
  String get appleMusicIcon => 'assets/si/apple_music_icon.si';

  /// List of all assets
  List<String> get values =>
      [appleMusicBadgeEn, appleMusicBadgeJa, appleMusicIcon];
}

class $AssetsImagesHowToGen {
  const $AssetsImagesHowToGen();

  /// File path: assets/images/how_to/step1_en.webp
  AssetGenImage get step1En =>
      const AssetGenImage('assets/images/how_to/step1_en.webp');

  /// File path: assets/images/how_to/step1_ja.webp
  AssetGenImage get step1Ja =>
      const AssetGenImage('assets/images/how_to/step1_ja.webp');

  /// File path: assets/images/how_to/step2_en.webp
  AssetGenImage get step2En =>
      const AssetGenImage('assets/images/how_to/step2_en.webp');

  /// File path: assets/images/how_to/step2_ja.webp
  AssetGenImage get step2Ja =>
      const AssetGenImage('assets/images/how_to/step2_ja.webp');

  /// File path: assets/images/how_to/step3_en.webp
  AssetGenImage get step3En =>
      const AssetGenImage('assets/images/how_to/step3_en.webp');

  /// File path: assets/images/how_to/step3_ja.webp
  AssetGenImage get step3Ja =>
      const AssetGenImage('assets/images/how_to/step3_ja.webp');

  /// File path: assets/images/how_to/step4_en.webp
  AssetGenImage get step4En =>
      const AssetGenImage('assets/images/how_to/step4_en.webp');

  /// File path: assets/images/how_to/step4_ja.webp
  AssetGenImage get step4Ja =>
      const AssetGenImage('assets/images/how_to/step4_ja.webp');

  /// File path: assets/images/how_to/step5_en.webp
  AssetGenImage get step5En =>
      const AssetGenImage('assets/images/how_to/step5_en.webp');

  /// File path: assets/images/how_to/step5_ja.webp
  AssetGenImage get step5Ja =>
      const AssetGenImage('assets/images/how_to/step5_ja.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        step1En,
        step1Ja,
        step2En,
        step2Ja,
        step3En,
        step3Ja,
        step4En,
        step4Ja,
        step5En,
        step5Ja
      ];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/screenshot_1.webp
  AssetGenImage get screenshot1 =>
      const AssetGenImage('assets/images/onboarding/screenshot_1.webp');

  /// File path: assets/images/onboarding/screenshot_2.webp
  AssetGenImage get screenshot2 =>
      const AssetGenImage('assets/images/onboarding/screenshot_2.webp');

  /// File path: assets/images/onboarding/screenshot_3.webp
  AssetGenImage get screenshot3 =>
      const AssetGenImage('assets/images/onboarding/screenshot_3.webp');

  /// List of all assets
  List<AssetGenImage> get values => [screenshot1, screenshot2, screenshot3];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSiGen si = $AssetsSiGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
