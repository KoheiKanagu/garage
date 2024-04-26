import 'package:core/core.dart' hide Assets;
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/gen/assets.gen.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: オンボーディングの画像を変更する
    return OnboardingPageBase(
      children: switch (LocaleSettings.currentLocale) {
        AppLocale.ja => [
            Assets.images.appIcon.image(),
            Assets.images.appIcon.image(),
            Assets.images.appIcon.image(),
          ],
        AppLocale.en => [
            Assets.images.appIcon.image(),
            Assets.images.appIcon.image(),
            Assets.images.appIcon.image(),
          ]
      },
    );
  }
}
