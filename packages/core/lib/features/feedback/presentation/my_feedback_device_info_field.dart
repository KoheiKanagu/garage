import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackDeviceInfoField extends HookConsumerWidget {
  const MyFeedbackDeviceInfoField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          children: [
            i18n.feedback.device_info_collection_notice.wrapBudouXText(
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ref.watch(feedbackDeviceInfoProvider).maybeWhen(
                  orElse: () => const CircularProgressIndicator.adaptive(),
                  data: (data) => Column(
                    children: [
                      ListTile(
                        title: Text(i18n.feedback.os_version),
                        trailing: Text(data.osVersion),
                        dense: true,
                      ),
                      ListTile(
                        title: Text(i18n.feedback.model_name),
                        trailing: Text(data.modelName),
                        dense: true,
                      ),
                      ListTile(
                        title: Text(i18n.feedback.locale),
                        trailing: Text(data.locale),
                        dense: true,
                      ),
                    ],
                  ),
                ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoListSection.insetGrouped(
          header: i18n.feedback.device_info_collection_notice.wrapBudouXText(
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          children: ref.watch(feedbackDeviceInfoProvider).maybeWhen(
                orElse: () => [
                  const CircularProgressIndicator.adaptive(),
                ],
                data: (data) => [
                  CupertinoListTile.notched(
                    title: Text(i18n.feedback.os_version),
                    trailing: Text(data.osVersion),
                  ),
                  CupertinoListTile.notched(
                    title: Text(i18n.feedback.model_name),
                    trailing: Text(data.modelName),
                  ),
                  CupertinoListTile.notched(
                    title: Text(i18n.feedback.locale),
                    trailing: Text(data.locale),
                  ),
                ],
              ),
        ),
    };
  }
}
