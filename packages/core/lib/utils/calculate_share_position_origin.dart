import 'package:flutter/widgets.dart';

Rect? calculateSharePositionOrigin(GlobalKey shareButtonKey) {
  final renderBox = shareButtonKey.currentContext?.findRenderObject();
  if (renderBox == null) {
    return null;
  }

  final size = (renderBox as RenderBox).size;
  final position = renderBox.localToGlobal(Offset.zero);

  return Rect.fromCenter(
    center: position + Offset(size.width / 2, size.height / 2),
    width: size.width,
    height: size.height,
  );
}
