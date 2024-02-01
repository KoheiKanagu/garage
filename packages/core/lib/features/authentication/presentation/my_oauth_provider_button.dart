// ignore_for_file: depend_on_referenced_packages

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:firebase_ui_oauth/firebase_ui_oauth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/cupertino.dart';
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

      final isSignIn = await ref.read(firebaseUserIsSignedInProvider.future);
      if (context.mounted) {
        provider.signIn(
          Theme.of(context).platform,
          isSignIn ? AuthAction.link : AuthAction.signIn,
        );
      }
    }

    Widget loadingIndicator(OAuthProvider provider) {
      final brightness = switch (InheritedThemeDetector.of(context)) {
        InheritedThemeType.material => Theme.of(context).colorScheme.brightness,
        InheritedThemeType.cupertino => CupertinoTheme.of(context).brightness,
      };

      return CircularProgressIndicator.adaptive(
        backgroundColor:
            provider.style.color.getValue(brightness ?? Brightness.light),
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
      action: AuthAction.none,
      onTap: () => onTap(provider),
      overrideDefaultTapAction: true,
      label: action.label(type),
      loadingIndicator: loadingIndicator(provider),
      onError: (exception) {
        logger.severe({
          'onError': provider.providerId,
          'exception': exception,
        });
      },
      onCancelled: () {
        logger.fine('onCancelled [${provider.providerId}]');
      },
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
  signInOrLink,
  unlink,
  ;

  String label(MyOAuthProviderType type) => switch (type) {
        MyOAuthProviderType.apple => switch (this) {
            MyOAuthProviderButtonAction.signInOrLink =>
              i18n.auth.sigh_in_with_apple,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_apple,
          },
        MyOAuthProviderType.google => switch (this) {
            MyOAuthProviderButtonAction.signInOrLink =>
              i18n.auth.sigh_in_with_google,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_google,
          },
        MyOAuthProviderType.github => switch (this) {
            MyOAuthProviderButtonAction.signInOrLink =>
              i18n.auth.sigh_in_with_github,
            MyOAuthProviderButtonAction.unlink => i18n.auth.unlink_github,
          },
      };
}
