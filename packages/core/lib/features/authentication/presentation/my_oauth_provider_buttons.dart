import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyOauthProviderButtons extends HookConsumerWidget {
  const MyOauthProviderButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: switch (ref.watch(firebaseUserLinkedProvidersProvider)) {
        AsyncData(:final value) => Column(
            children: [
              MyOAuthProviderButton(
                type: MyOAuthProviderType.apple,
                action: value?.contains(AppleAuthProvider.PROVIDER_ID) ?? false
                    ? MyOAuthProviderButtonAction.unlink
                    : MyOAuthProviderButtonAction.signInOrLink,
              ),
              MyOAuthProviderButton(
                type: MyOAuthProviderType.google,
                action: value?.contains(GoogleAuthProvider.PROVIDER_ID) ?? false
                    ? MyOAuthProviderButtonAction.unlink
                    : MyOAuthProviderButtonAction.signInOrLink,
              ),
              MyOAuthProviderButton(
                type: MyOAuthProviderType.github,
                action: value?.contains(GithubAuthProvider.PROVIDER_ID) ?? false
                    ? MyOAuthProviderButtonAction.unlink
                    : MyOAuthProviderButtonAction.signInOrLink,
              ),
            ],
          ),
        _ => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      },
    );
  }
}
