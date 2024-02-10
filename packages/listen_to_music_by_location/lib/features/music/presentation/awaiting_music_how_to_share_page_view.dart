import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/gen/assets.gen.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class AwaitingMusicHowToSharePageView extends HookConsumerWidget {
  const AwaitingMusicHowToSharePageView(
    this.controller, {
    super.key,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = [
      _buildColumn(
        image: switch (LocaleSettings.currentLocale) {
          AppLocale.ja => Assets.images.howTo.step1Ja.image(),
          AppLocale.en => Assets.images.howTo.step1En.image(),
        },
        text: i18n.locamusic.how_to_share_step_1,
        context: context,
      ),
      _buildColumn(
        image: switch (LocaleSettings.currentLocale) {
          AppLocale.ja => Assets.images.howTo.step2Ja.image(),
          AppLocale.en => Assets.images.howTo.step2En.image(),
        },
        text: i18n.locamusic.how_to_share_step_2,
        context: context,
      ),
      _buildColumn(
        image: switch (LocaleSettings.currentLocale) {
          AppLocale.ja => Assets.images.howTo.step3Ja.image(),
          AppLocale.en => Assets.images.howTo.step3En.image(),
        },
        text: i18n.locamusic.how_to_share_step_3,
        context: context,
      ),
      _buildColumn(
        image: switch (LocaleSettings.currentLocale) {
          AppLocale.ja => Assets.images.howTo.step4Ja.image(),
          AppLocale.en => Assets.images.howTo.step4En.image(),
        },
        text: i18n.locamusic.how_to_share_step_4,
        context: context,
      ),
      _buildColumn(
        image: switch (LocaleSettings.currentLocale) {
          AppLocale.ja => Assets.images.howTo.step5Ja.image(),
          AppLocale.en => Assets.images.howTo.step5En.image(),
        },
        text: i18n.locamusic.how_to_share_step_5,
        context: context,
      ),
    ];

    return Column(
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
      ],
    );
  }

  Widget _buildColumn({
    required Image image,
    required String text,
    required BuildContext context,
  }) =>
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: CupertinoColors.systemGrey5.resolveFrom(context),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: image,
            ),
          ),
          const Gap(24),
          text.wrapBudouXText(
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            alignment: WrapAlignment.center,
          ),
          const Gap(12),
        ],
      );
}
