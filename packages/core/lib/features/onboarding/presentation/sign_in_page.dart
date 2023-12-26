import 'package:core/core.dart';
import 'package:core/features/authentication/presentation/my_oauth_provider_buttons.dart';
import 'package:core/features/onboarding/presentation/term_ack_text.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const padding = EdgeInsets.symmetric(
      horizontal: 16,
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: i18n.onboarding.social_account_sign_in.wrapBudouXText(
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: i18n.onboarding.social_account_sign_in_description
                  .wrapBudouXText(),
            ),
            const MyOauthProviderButtons(),
            const Gap(16),
            Row(
              children: [
                const Expanded(
                  child: Divider(),
                ),
                const Gap(8),
                Text(
                  i18n.onboarding.or,
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                const Expanded(
                  child: Divider(),
                ),
              ],
            ),
            const Gap(16),
            Padding(
              padding: padding,
              child: FilledButton(
                onPressed: () async {
                  await ref.read(firebaseSignInProvider.future);
                },
                child: switch (ref.watch(firebaseUserIsSignedInProvider)) {
                  AsyncData() => Text(
                      i18n.onboarding.anonymous_start,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  _ => Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: padding,
          child: TermAckText(),
        ),
      ),
    );
  }
}
