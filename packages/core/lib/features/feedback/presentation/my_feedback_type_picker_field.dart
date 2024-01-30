import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackTypePickerField extends HookConsumerWidget {
  const MyFeedbackTypePickerField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(feedbackDataControllerProvider).asData?.value;
    if (data == null) {
      return const SizedBox.shrink();
    }

    Future<void> onTap() async {
      final result = await showConfirmationDialog<FeedbackType>(
        context: context,
        title: i18n.feedback.feedback_type_header,
        initialSelectedActionKey: data.type,
        actions: FeedbackType.values
            .map(
              (e) => AlertDialogAction(
                key: e,
                label: e.localizedString,
              ),
            )
            .toList(),
      );
      if (result == null) {
        return;
      }

      ref.read(feedbackDataControllerProvider.notifier).updateType(result);
    }

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            i18n.feedback.feedback_type_header.wrapBudouXText(
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ListTile(
              title: Text(data.type.localizedString),
              leading: data.type.icon,
              onTap: onTap,
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.feedback_type_header),
          children: [
            CupertinoListTile.notched(
              title: Text(data.type.localizedString),
              trailing: const CupertinoListTileChevron(),
              leading: data.type.iconCupertino,
              onTap: onTap,
            ),
          ],
        ),
    };
  }
}
