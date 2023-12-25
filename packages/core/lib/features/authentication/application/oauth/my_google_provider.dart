// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:core/i18n/strings.g.dart';
import 'package:firebase_ui_oauth/src/oauth_provider_button_style.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class MyGoogleProvider extends GoogleProvider {
  MyGoogleProvider({
    required super.clientId,
    required super.iOSPreferPlist,
    required List<String> super.scopes,
  });

  @override
  ThemedOAuthProviderButtonStyle get style =>
      const MyGoogleProviderButtonStyle();
}

class MyGoogleProviderButtonStyle extends GoogleProviderButtonStyle {
  const MyGoogleProviderButtonStyle();

  @override
  String? get label => i18n.auth.sigh_in_with_google;
}
