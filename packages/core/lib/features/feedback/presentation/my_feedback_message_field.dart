import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackMessageField extends HookConsumerWidget {
  const MyFeedbackMessageField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(feedbackDataControllerProvider).asData?.value;

    final controller = useTextEditingController(
      text: data?.message,
    );

    String? validator(String? value) => ref
            .watch(feedbackDataControllerProvider.notifier)
            .validateMessage(value)
        ? null
        : i18n.feedback.please_enter_your_feedback;

    void onSaved(String? newValue) => ref
        .watch(feedbackDataControllerProvider.notifier)
        .updateMessage(newValue);

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(i18n.feedback.do_not_enter_personal_info),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              maxLength: 1000,
              maxLines: 5,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: controller,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: onSaved,
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.do_not_enter_personal_info),
          children: [
            CupertinoTextFormFieldRow(
              maxLength: 1000,
              maxLines: 5,
              minLines: 2,
              keyboardType: TextInputType.multiline,
              controller: controller,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: onSaved,
            ),
          ],
        ),
    };
  }
}
