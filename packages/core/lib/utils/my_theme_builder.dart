import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThemeBuilder {
  MyThemeBuilder({
    required this.baseColor,
    required this.baseDarkColor,
  }) {
    cupertinoThemeData = CupertinoThemeData(
      primaryColor: CupertinoDynamicColor.withBrightness(
        color: baseColor,
        darkColor: baseDarkColor,
      ),
    );

    materialLightThemeData = FlexThemeData.light(
      colors: FlexSchemeColor.from(
        primary: baseColor,
      ),
      useMaterial3: true,
    );

    materialDarkThemeData = FlexThemeData.dark(
      colors: FlexSchemeColor.from(
        primary: baseDarkColor,
      ),
      darkIsTrueBlack: true,
      useMaterial3: true,
    );
  }

  final Color baseColor;

  final Color baseDarkColor;

  late final CupertinoThemeData cupertinoThemeData;

  late final ThemeData materialLightThemeData;

  late final ThemeData materialDarkThemeData;

  ThemeData materialThemeData(Brightness brightness) =>
      brightness == Brightness.light
          ? materialLightThemeData
          : materialDarkThemeData;
}
