import 'package:core/core.dart';
import 'package:flutter/material.dart';
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
    Widget buildColumn(Image image, String text) => Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.2),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: image,
              ),
            ),
            const Gap(24),
            text.wrapBudouXText(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              alignment: WrapAlignment.center,
            ),
            const Gap(12),
          ],
        );

    return PageView(
      controller: controller,
      children: [
        buildColumn(
          Assets.images.howTo.step1.image(),
          i18n.locamusic.how_to_share_step_1,
        ),
        buildColumn(
          Assets.images.howTo.step2.image(),
          i18n.locamusic.how_to_share_step_2,
        ),
        buildColumn(
          Assets.images.howTo.step3.image(),
          i18n.locamusic.how_to_share_step_3,
        ),
      ],
    );
  }
}
