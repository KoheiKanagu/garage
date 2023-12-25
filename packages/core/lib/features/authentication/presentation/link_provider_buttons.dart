import 'package:core/core.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkProviderButtons extends HookConsumerWidget {
  const LinkProviderButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          title: i18n.configure.link_account.wrapBudouXText(
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: i18n.configure.link_account_description.wrapBudouXText(),
        ),
        ListTile(
          subtitle: i18n.configure.link_account_description2.wrapBudouXText(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ref.watch(firebaseUserLinkedProvidersProvider).maybeWhen(
                orElse: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                data: (data) => Column(
                  children: [
                    MyOAuthProviderButton(
                      type: MyOAuthProviderType.apple,
                      action: data.contains(AppleAuthProvider.PROVIDER_ID)
                          ? MyOAuthProviderButtonAction.unlink
                          : MyOAuthProviderButtonAction.signIn,
                    ),
                    MyOAuthProviderButton(
                      type: MyOAuthProviderType.google,
                      action: data.contains(GoogleAuthProvider.PROVIDER_ID)
                          ? MyOAuthProviderButtonAction.unlink
                          : MyOAuthProviderButtonAction.signIn,
                    ),
                    MyOAuthProviderButton(
                      type: MyOAuthProviderType.github,
                      action: data.contains(GithubAuthProvider.PROVIDER_ID)
                          ? MyOAuthProviderButtonAction.unlink
                          : MyOAuthProviderButtonAction.signIn,
                    ),
                  ],
                ),
              ),
        ),
      ],
    );
  }
}
