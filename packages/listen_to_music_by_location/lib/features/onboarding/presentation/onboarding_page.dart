import 'package:core/core.dart' hide Assets;
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
            Assets.images.onboarding.screenshot0.image(),
            Assets.images.onboarding.screenshot1.image(),
            Assets.images.onboarding.screenshot2.image(),
            Assets.images.onboarding.screenshot3.image(),
          ],
        AppLocale.en => [
            Assets.images.onboarding.screenshot4.image(),
            Assets.images.onboarding.screenshot5.image(),
            Assets.images.onboarding.screenshot6.image(),
            Assets.images.onboarding.screenshot7.image(),
          ]
      },
    );
  }
}
