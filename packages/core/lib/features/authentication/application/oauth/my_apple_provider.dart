// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:core/i18n/strings.g.dart';
import 'package:firebase_ui_oauth/src/oauth_provider_button_style.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_shared/src/themed.dart';

class MyAppleProvider extends AppleProvider {
  @override
  ThemedOAuthProviderButtonStyle get style =>
      const MyAppleProviderButtonStyle();
}

class MyAppleProviderButtonStyle extends AppleProviderButtonStyle {
  const MyAppleProviderButtonStyle();

  @override
  String? get label => i18n.auth.sigh_in_with_apple;

  @override
  ThemedColor get iconBackgroundColor => super.backgroundColor;
}
