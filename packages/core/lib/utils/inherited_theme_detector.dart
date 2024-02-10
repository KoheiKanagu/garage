import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedThemeDetector {
  static InheritedThemeType of(BuildContext context) {
    // return InheritedThemeType.material;

    return CupertinoTheme.of(context) is MaterialBasedCupertinoThemeData
        ? InheritedThemeType.material
        : InheritedThemeType.cupertino;
  }
}

enum InheritedThemeType {
  material,
  cupertino,
  ;
}
