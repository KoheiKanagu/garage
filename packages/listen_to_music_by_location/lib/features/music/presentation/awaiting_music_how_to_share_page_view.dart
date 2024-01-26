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
        image: Assets.images.howTo.step1.image(),
        text: i18n.locamusic.how_to_share_step_1,
        context: context,
      ),
      _buildColumn(
        image: Assets.images.howTo.step2.image(),
        text: i18n.locamusic.how_to_share_step_2,
        context: context,
      ),
      _buildColumn(
        image: Assets.images.howTo.step3.image(),
        text: i18n.locamusic.how_to_share_step_3,
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
