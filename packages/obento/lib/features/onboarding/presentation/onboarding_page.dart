import 'package:core/core.dart' hide Assets;
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingPageBase(
      children: switch (LocaleSettings.currentLocale) {
        AppLocale.ja => [],
        AppLocale.en => []
      },
    );
  }
}
