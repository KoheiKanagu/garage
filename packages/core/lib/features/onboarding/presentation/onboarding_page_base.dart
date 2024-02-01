import 'package:core/common_widgets/my_smooth_page_indicator.dart';
import 'package:core/features/onboarding/application/sign_in_route.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPageBase extends HookConsumerWidget {
  const OnboardingPageBase({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    final body = Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: children,
          ),
        ),
        const Gap(12),
        MySmoothPageIndicator(
          controller: controller,
          count: children.length,
        ),
        const Gap(24),
      ],
    );

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          body: body,
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: FilledButton(
                onPressed: () {
                  const SignInPageRoute().push<void>(context);
                },
                child: Text(
                  i18n.onboarding.start,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          child: Column(
            children: [
              Expanded(
                child: body,
              ),
              SizedBox(
                width: double.infinity,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: CupertinoButton.filled(
                      onPressed: () {
                        const SignInPageRoute().push<void>(context);
                      },
                      child: Text(i18n.onboarding.start),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    };
  }
}
