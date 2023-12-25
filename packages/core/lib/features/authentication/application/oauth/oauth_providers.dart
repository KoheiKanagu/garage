// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:core/features/authentication/application/oauth/my_apple_provider.dart';
import 'package:core/features/authentication/application/oauth/my_github_provider.dart';
import 'package:core/features/authentication/application/oauth/my_google_provider.dart';

final firebaseUIAuthProviders = [
  MyAppleProvider(),
  MyGoogleProvider(
    clientId: 'ignore',
    iOSPreferPlist: true,
    scopes: [
      'email',
    ],
  ),
  MyGitHubProvider(),
];
