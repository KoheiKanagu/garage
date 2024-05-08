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
    final data = ref.watch(feedbackDeviceInfoProvider).asData?.value;
    if (data == null) {
      return const SizedBox.shrink();
    }

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              i18n.feedback.device_info,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            ListTile(
              title: Text(i18n.feedback.os_version),
              trailing: Text(data.osVersion),
            ),
            ListTile(
              title: Text(i18n.feedback.model_name),
              trailing: Text(data.modelName),
            ),
            ListTile(
              title: Text(i18n.feedback.locale),
              trailing: Text(data.locale),
            ),
            Text(
              i18n.feedback.device_info_collection_notice,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.device_info),
          footer: Text(i18n.feedback.device_info_collection_notice),
          children: [
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
    };
  }
}
