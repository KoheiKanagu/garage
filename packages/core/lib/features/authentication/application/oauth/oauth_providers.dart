// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:core/features/authentication/application/oauth/github_provider.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

final firebaseUIAuthProviders = [
  AppleProvider(),
  GoogleProvider(
    clientId: 'ignore',
    iOSPreferPlist: true,
    scopes: [
      'email',
    ],
  ),
  GitHubProvider(),
];
