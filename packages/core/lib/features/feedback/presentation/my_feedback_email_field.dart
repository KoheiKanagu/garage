import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackEmailField extends HookConsumerWidget {
  const MyFeedbackEmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(feedbackDataControllerProvider).asData?.value;

    final controller = useTextEditingController(
      text: data?.email,
    );

    String? validator(String? value) => ref.watch(
          feedbackValidateEmailProvider(
            value: value,
            errorMessage: i18n.feedback.too_long,
          ),
        );

    void onSaved(String? newValue) => ref
        .watch(feedbackDataControllerProvider.notifier)
        .updateEmail(newValue);

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'email@example.com',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                counter: const SizedBox.shrink(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text(i18n.feedback.email_address),
              ),
              maxLength: 1024,
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              validator: validator,
              onSaved: onSaved,
            ),
            Text(
              i18n.feedback.input_email_if_reply_is_needed,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoFormSection.insetGrouped(
          header: Text(i18n.feedback.email_address),
          footer: Text(i18n.feedback.input_email_if_reply_is_needed),
          children: [
            CupertinoTextFormFieldRow(
              placeholder: 'email@example.com',
              maxLength: 1024,
              keyboardType: TextInputType.emailAddress,
              controller: controller,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: onSaved,
            ),
          ],
        )
    };
  }
}
