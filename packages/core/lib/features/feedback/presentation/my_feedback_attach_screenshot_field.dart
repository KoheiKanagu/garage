import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackAttachScreenshotField extends HookConsumerWidget {
  const MyFeedbackAttachScreenshotField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(feedbackAttachScreenshotControllerProvider);

    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              i18n.feedback.screenshot,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            SwitchListTile(
              value: value,
              onChanged: (_) {
                ref
                    .watch(
                      feedbackAttachScreenshotControllerProvider.notifier,
                    )
                    .toggle();
              },
              title: Text(i18n.feedback.attach_screenshot),
            ),
            Text(
              i18n.feedback.attach_screenshot_notice,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.screenshot),
          footer: Text(i18n.feedback.attach_screenshot_notice),
          children: [
            CupertinoListTile.notched(
              title: Text(i18n.feedback.attach_screenshot),
              trailing: CupertinoSwitch(
                value: value,
                onChanged: (_) {
                  ref
                      .watch(
                        feedbackAttachScreenshotControllerProvider.notifier,
                      )
                      .toggle();
                },
              ),
            ),
          ],
        )
    };
  }
}
