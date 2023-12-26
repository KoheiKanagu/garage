import 'package:core/features/onboarding/application/onboarding_route.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = useState(0);
    final controller = usePageController(
      initialPage: currentPageIndex.value,
    );

    final children = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

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
          SmoothPageIndicator(
            controller: controller,
            count: children.length,
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            effect: WormEffect(
              type: WormType.thinUnderground,
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
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
