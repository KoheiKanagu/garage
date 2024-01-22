import 'package:core/common_widgets/my_smooth_page_indicator.dart';
import 'package:core/features/onboarding/application/sign_in_route.dart';
import 'package:core/gen/strings.g.dart';
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

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: children,
            ),
          ),
          const Gap(12),
          MySmoothPageIndicator(controller),
          const Gap(24),
        ],
      ),
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
    );
  }
}
