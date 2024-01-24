import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final progressAnonymousStart = useState(false);

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
                onPressed: progressAnonymousStart.value
                    ? null
                    : () async {
                        if (progressAnonymousStart.value) {
                          return;
                        }

                        progressAnonymousStart.value = true;
                        await ref.read(firebaseSignInProvider.future);
                        progressAnonymousStart.value = false;
                      },
                child: progressAnonymousStart.value
                    ? CircularProgressIndicator.adaptive(
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      )
                    : Text(
                        i18n.onboarding.anonymous_start,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
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
