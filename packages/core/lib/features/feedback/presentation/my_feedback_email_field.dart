import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackEmailField extends HookConsumerWidget {
  const MyFeedbackEmailField({
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
            i18n.feedback.input_email_if_reply_is_needed.wrapBudouXText(
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Gap(4),
            i18n.feedback.input_email_if_reply_is_needed2.wrapBudouXText(
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Gap(8),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'email@example.com',
                counter: const SizedBox.shrink(),
                labelText: i18n.feedback.email_address,
              ),
              maxLength: 256,
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              onSaved: (newValue) => controller.text = newValue?.trim() ?? '',
            ),
          ],
        ),
      InheritedThemeType.cupertino => Container(),
    };
  }
}
