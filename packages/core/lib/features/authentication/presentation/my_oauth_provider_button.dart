// ignore_for_file: depend_on_referenced_packages

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/features/authentication/application/firebase_user_providers.dart';
import 'package:core/features/authentication/application/oauth/github_provider.dart';
import 'package:core/features/authentication/application/oauth/oauth_providers.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyOAuthProviderButton extends HookConsumerWidget {
  const MyOAuthProviderButton({
    required this.type,
    required this.action,
    super.key,
  });

  final MyOAuthProviderType type;

  final MyOAuthProviderButtonAction action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onTap(OAuthProvider provider) async {
      if (action == MyOAuthProviderButtonAction.unlink) {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: i18n.auth.unlink_confirm(
            account: type.providerName,
          ),
          isDestructiveAction: true,
          okLabel: i18n.auth.unlink,
        );

        if (result == OkCancelResult.ok) {
          await ref.read(
            firebaseUserUnlinkProviderProvider(
              type.providerId,
            ).future,
          );
        }
        return;
      }

      provider.signIn(
        Theme.of(context).platform,
        action.toAuthAction,
      );
    }

    Widget loadingIndicator(OAuthProvider provider) {
      final brightness = Theme.of(context).colorScheme.brightness;

      return CircularProgressIndicator.adaptive(
        backgroundColor: provider.style.color.getValue(brightness),
      );
    }

    final provider = switch (type) {
      MyOAuthProviderType.apple =>
        firebaseUIAuthProviders.whereType<AppleProvider>().single,
      MyOAuthProviderType.google =>
        firebaseUIAuthProviders.whereType<GoogleProvider>().single,
      MyOAuthProviderType.github =>
        firebaseUIAuthProviders.whereType<GitHubProvider>().single,
    };

    return OAuthProviderButtonBase(
      provider: provider,
      action: action.toAuthAction,
      onTap: () => onTap(provider),
      overrideDefaultTapAction: true,
      label: action.label(type),
      loadingIndicator: loadingIndicator(provider),
    );
  }
}

enum MyOAuthProviderType {
  apple,
  google,
  github,
  ;

  String get providerName => switch (this) {
        MyOAuthProviderType.apple => i18n.auth.apple_id,
        MyOAuthProviderType.google => i18n.auth.google_account,
        MyOAuthProviderType.github => i18n.auth.github_account,
      };

  String get providerId => switch (this) {
        MyOAuthProviderType.apple => fa.AppleAuthProvider.PROVIDER_ID,
        MyOAuthProviderType.google => fa.GoogleAuthProvider.PROVIDER_ID,
        MyOAuthProviderType.github => fa.GithubAuthProvider.PROVIDER_ID,
      };
}

enum MyOAuthProviderButtonAction {
  signIn,
  link,
  unlink,
  ;

  AuthAction get toAuthAction => switch (this) {
        MyOAuthProviderButtonAction.signIn => AuthAction.signIn,
        MyOAuthProviderButtonAction.link => AuthAction.link,
        _ => AuthAction.none,
      };

  String label(MyOAuthProviderType type) => switch (type) {
        MyOAuthProviderType.apple => switch (this) {
            MyOAuthProviderButtonAction.signIn ||
            MyOAuthProviderButtonAction.link =>
              i18n.auth.sigh_in_with_apple,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_apple,
          },
        MyOAuthProviderType.google => switch (this) {
            MyOAuthProviderButtonAction.signIn ||
            MyOAuthProviderButtonAction.link =>
              i18n.auth.sigh_in_with_google,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_google,
          },
        MyOAuthProviderType.github => switch (this) {
            MyOAuthProviderButtonAction.signIn ||
            MyOAuthProviderButtonAction.link =>
              i18n.auth.sigh_in_with_github,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_github,
          },
      };
}
