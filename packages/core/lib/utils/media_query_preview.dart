// ignore_for_file: avoid_returning_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MediaQueryPreview {
  MediaQueryPreview(
    this.context,
    this.child, {
    this.cupertino = false,
  });

  final BuildContext context;

  final Widget? child;

  final bool cupertino;

  EdgeInsets? _padding;

  double? _textScaleFactor;

  TargetPlatform? _targetPlatform;

  MediaQueryPreview disableDynamicIsland() {
    _padding = MediaQuery.paddingOf(context);
    return this;
  }

  MediaQueryPreview textScale05() {
    _textScaleFactor = 0.5;
    return this;
  }

  MediaQueryPreview textScale10() {
    _textScaleFactor = 1;
    return this;
  }

  MediaQueryPreview textScale15() {
    _textScaleFactor = 1.5;
    return this;
  }

  MediaQueryPreview textScale20() {
    _textScaleFactor = 2;
    return this;
  }

  MediaQueryPreview android() {
    _targetPlatform = TargetPlatform.android;
    return this;
  }

  Widget build() {
    if (kReleaseMode) {
      return child!;
    }

    return Padding(
      padding: _padding ?? EdgeInsets.zero,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          padding: _padding == null ? null : EdgeInsets.zero,
          viewPadding: _padding == null ? null : EdgeInsets.zero,
          textScaler: TextScaler.linear(
            _textScaleFactor ?? 1,
          ),
        ),
        child: cupertino
            ? CupertinoTheme(
                data: CupertinoTheme.of(context),
                child: child!,
              )
            : Theme(
                data: Theme.of(context).copyWith(
                  platform: _targetPlatform ?? Theme.of(context).platform,
                ),
                child: child!,
              ),
      ),
    );
  }
}
