import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/gen/assets.gen.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingPageBase(
      children: switch (LocaleSettings.currentLocale) {
        AppLocale.ja => [
            Assets.images.onboarding.screenshot1Ja.image(),
            Assets.images.onboarding.screenshot2Ja.image(),
            Assets.images.onboarding.screenshot3Ja.image(),
            Assets.images.onboarding.screenshot4Ja.image(),
          ],
        AppLocale.en => [
            Assets.images.onboarding.screenshot1En.image(),
            Assets.images.onboarding.screenshot2En.image(),
            Assets.images.onboarding.screenshot3En.image(),
            Assets.images.onboarding.screenshot4En.image(),
          ]
      },
    );
  }
}
