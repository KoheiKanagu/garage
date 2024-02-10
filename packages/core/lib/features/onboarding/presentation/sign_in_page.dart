import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
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
    const ackWidget = SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: TermAckText(),
      ),
    );

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: ackWidget,
          body: ListView(
            children: [
              MyOauthProviderButtons(
                header: i18n.onboarding.social_account_sign_in,
                footers: [
                  i18n.onboarding.social_account_sign_in_description,
                ],
              ),
              const _OrDivider(),
              const Gap(16),
              const _AnonymousStartButton(),
            ],
          ),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          navigationBar: const CupertinoNavigationBar(),
          child: Scaffold(
            backgroundColor:
                CupertinoColors.systemGroupedBackground.resolveFrom(context),
            bottomNavigationBar: ackWidget,
            body: ListView(
              children: [
                MyOauthProviderButtons(
                  header: i18n.onboarding.social_account_sign_in,
                  footers: [
                    i18n.onboarding.social_account_sign_in_description,
                  ],
                ),
                const _OrDivider(),
                const Gap(16),
                const _AnonymousStartButton(),
              ],
            ),
          ),
        ),
    };
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final themeType = InheritedThemeDetector.of(context);
    final color = switch (themeType) {
      InheritedThemeType.material => Colors.grey,
      InheritedThemeType.cupertino =>
        CupertinoColors.systemGrey.resolveFrom(context),
    };

    final textStyle = switch (themeType) {
      InheritedThemeType.material => Theme.of(context).textTheme.bodyMedium,
      InheritedThemeType.cupertino =>
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 14,
            ),
    };

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
        const Gap(8),
        Text(
          i18n.onboarding.or,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
        const Gap(8),
        Expanded(
          child: Divider(
            color: color,
          ),
        ),
      ],
    );
  }
}

class _AnonymousStartButton extends HookConsumerWidget {
  const _AnonymousStartButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAnonymousStart = useState(false);

    Future<void> onPressedAnonymousStart() async {
      if (progressAnonymousStart.value) {
        return;
      }

      progressAnonymousStart.value = true;
      await ref.read(firebaseSignInProvider.future).catchError(
            // 成功した場合はGoRouterでリダイレクトされるので、
            // progressAnonymousStartはfalseにする必要はない。
            // エラーになった場合は再試行する可能性があるので、falseにする。
            (_) => progressAnonymousStart.value = false,
          );
    }

    final themeType = InheritedThemeDetector.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: switch (themeType) {
        InheritedThemeType.material => FilledButton(
            onPressed: onPressedAnonymousStart,
            child: progressAnonymousStart.value
                ? CircularProgressIndicator.adaptive(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  )
                : Text(
                    i18n.onboarding.anonymous_start,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
          ),
        InheritedThemeType.cupertino => CupertinoButton.filled(
            onPressed: onPressedAnonymousStart,
            child: progressAnonymousStart.value
                ? CircularProgressIndicator.adaptive(
                    backgroundColor:
                        CupertinoTheme.of(context).primaryContrastingColor,
                  )
                : Text(
                    i18n.onboarding.anonymous_start,
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
          ),
      },
    );
  }
}
