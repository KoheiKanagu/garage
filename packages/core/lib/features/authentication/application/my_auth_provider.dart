import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_auth_provider.g.dart';

@riverpod
AuthProvider myAuth(
  MyAuthRef ref,
  MyAuthProviderType type,
) =>
    switch (type) {
      MyAuthProviderType.apple => AppleAuthProvider()..addScope('email'),
      MyAuthProviderType.google => GoogleAuthProvider()
        ..addScope('email')
        ..setCustomParameters({'prompt': 'select_account'}),
      MyAuthProviderType.github => GithubAuthProvider()..addScope('email'),
    };

@riverpod
Future<void> myAuthSignInOrLink(
  MyAuthSignInOrLinkRef ref,
  AuthProvider authProvider,
) async {
  try {
    final currentUser = await ref.watch(firebaseUserProvider.future);
    if (currentUser != null) {
      await currentUser.linkWithProvider(authProvider);
    } else {
      await ref.watch(firebaseAuthProvider).signInWithPopup(authProvider);
    }
  } on Exception catch (exception) {
    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case 'web-context-cancelled':
          logger.debug(
            {
              'message': 'onCancelled',
              'providerId': authProvider.providerId,
              'exceptionMessage': exception.message,
              'exceptionCode': exception.code,
            },
          );
          return;

        case 'canceled':
          logger.debug(
            {
              'message': 'onCancelled',
              'providerId': authProvider.providerId,
              'exceptionMessage': exception.message,
              'exceptionCode': exception.code,
            },
          );
          return;
      }
    }

    logger.handle(
      exception,
      StackTrace.current,
      'provider id: ${authProvider.providerId}',
    );
  }
}

@riverpod
Future<void> myAuthUnlink(
  MyAuthUnlinkRef ref,
  AuthProvider authProvider,
) =>
    ref.watch(
      firebaseUserUnlinkProviderProvider(authProvider.providerId).future,
    );

@riverpod
Future<bool> myAuthIsLinked(
  MyAuthIsLinkedRef ref,
  AuthProvider authProvider,
) async {
  final linked = await ref.watch(firebaseUserLinkedProvidersProvider.future);
  return linked?.contains(authProvider.providerId) ?? false;
}

enum MyAuthProviderType {
  apple,
  google,
  github,
  ;

  String get providerName => switch (this) {
        MyAuthProviderType.apple => i18n.auth.apple_id,
        MyAuthProviderType.google => i18n.auth.google_account,
        MyAuthProviderType.github => i18n.auth.github_account,
      };

  String get signInLabel => switch (this) {
        MyAuthProviderType.apple => i18n.auth.sigh_in_with_apple,
        MyAuthProviderType.google => i18n.auth.sigh_in_with_google,
        MyAuthProviderType.github => i18n.auth.sigh_in_with_github,
      };

  String get unlinkLabel => switch (this) {
        MyAuthProviderType.apple => i18n.auth.unlink_apple,
        MyAuthProviderType.google => i18n.auth.unlink_google,
        MyAuthProviderType.github => i18n.auth.unlink_github,
      };

  EdgeInsets get logoPadding => switch (this) {
        MyAuthProviderType.apple => const EdgeInsets.all(6),
        MyAuthProviderType.google => const EdgeInsets.all(4),
        MyAuthProviderType.github => const EdgeInsets.all(12),
      };

  Color textColorOf(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return switch (brightness) {
      Brightness.light => Colors.white,
      Brightness.dark => Colors.black,
    };
  }

  Color logoBackgroundColorOf(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return switch (brightness) {
      Brightness.light => switch (this) {
          MyAuthProviderType.apple => Colors.black,
          MyAuthProviderType.google => const Color(0xFF131314),
          MyAuthProviderType.github => Colors.black,
        },
      Brightness.dark => Colors.white,
    };
  }

  String logoAssetPathOf(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return switch (brightness) {
      Brightness.light => switch (this) {
          MyAuthProviderType.apple => 'packages/core/${Assets.si.appleDark}',
          MyAuthProviderType.google => 'packages/core/${Assets.si.googleDark}',
          MyAuthProviderType.github => 'packages/core/${Assets.si.githubDark}',
        },
      Brightness.dark => switch (this) {
          MyAuthProviderType.apple => 'packages/core/${Assets.si.appleLight}',
          MyAuthProviderType.google => 'packages/core/${Assets.si.googleLight}',
          MyAuthProviderType.github => 'packages/core/${Assets.si.githubLight}',
        },
    };
  }
}
