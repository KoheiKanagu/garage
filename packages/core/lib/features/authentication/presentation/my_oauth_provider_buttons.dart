import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

class MyOauthProviderButtons extends HookConsumerWidget {
  const MyOauthProviderButtons({
    required this.header,
    required this.footers,
    super.key,
  });

  final String header;

  final List<String> footers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttons = switch (ref.watch(firebaseUserLinkedProvidersProvider)) {
      AsyncData(:final value) => [
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
      _ => [
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ],
    };

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Column(
          children: [
            ListTile(
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(header),
              ),
              titleTextStyle:
                  Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
            ),
            ListTile(
              title: Column(
                children: buttons,
              ),
            ),
            ...footers.map(
              (e) => ListTile(
                title: Text(e),
                titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoListSection.insetGrouped(
          header: header.wrapBudouXText(),
          footer: DefaultTextStyle(
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 14,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: footers
                  .map<Widget>(Text.new)
                  .intersperse(const Gap(8))
                  .toList(),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          separatorColor: Colors.transparent,
          children: buttons,
        ),
    };
  }
}
