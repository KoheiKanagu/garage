import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackMessageField extends HookConsumerWidget {
  const MyFeedbackMessageField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            i18n.feedback.do_not_enter_personal_info.wrapBudouXText(
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Gap(8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              maxLength: 1000,
              maxLines: 2,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: controller,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return i18n.feedback.please_enter_your_feedback;
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) => controller.text = newValue?.trim() ?? '',
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.do_not_enter_personal_info),
          children: [
            CupertinoTextFormFieldRow(
              maxLength: 1000,
              maxLines: 5,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: controller,
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return i18n.feedback.please_enter_your_feedback;
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (newValue) => controller.text = newValue?.trim() ?? '',
            ),
          ],
        ),
    };
  }
}
