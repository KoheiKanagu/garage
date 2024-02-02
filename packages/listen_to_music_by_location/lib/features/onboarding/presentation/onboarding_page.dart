import 'package:core/core.dart';
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
      children: [
        Assets.images.onboarding.screenshot1.image(),
        Assets.images.onboarding.screenshot2.image(),
        Assets.images.onboarding.screenshot3.image(),
      ],
    );
  }
}
