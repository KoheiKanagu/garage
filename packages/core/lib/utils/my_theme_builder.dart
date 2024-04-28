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

    final material = ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: baseColor,
      ),
      useMaterial3: true,
    );

    final materialDark = ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: baseColor,
      ),
      useMaterial3: true,
    );

    materialLightThemeData = material.copyWith(
      listTileTheme: material.listTileTheme.copyWith(
        iconColor: material.colorScheme.primary,
      ),
    );

    materialDarkThemeData = materialDark.copyWith(
      listTileTheme: materialDark.listTileTheme.copyWith(
        iconColor: materialDark.colorScheme.primary,
      ),
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
