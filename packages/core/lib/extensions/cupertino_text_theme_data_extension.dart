import 'package:flutter/cupertino.dart';

extension CupertinoTextThemeDataExtension on CupertinoTextThemeData {
  CupertinoTextThemeData apply({
    String? fontFamily,
  }) =>
      copyWith(
        textStyle: textStyle.copyWith(
          fontFamily: fontFamily,
        ),
        actionTextStyle: actionTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        tabLabelTextStyle: tabLabelTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        navTitleTextStyle: navTitleTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        navLargeTitleTextStyle: navLargeTitleTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        navActionTextStyle: navActionTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        pickerTextStyle: pickerTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
        dateTimePickerTextStyle: dateTimePickerTextStyle.copyWith(
          fontFamily: fontFamily,
        ),
      );
}
