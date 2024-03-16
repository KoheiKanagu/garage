import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/features/feedback/application/feedback_providers.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackSubmitButton extends HookConsumerWidget {
  const MyFeedbackSubmitButton(
    this.submit, {
    super.key,
  });

  final OnSubmit submit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmitPressed() async {
      final validate = feedbackFormKey.currentState?.validate() ?? false;
      if (!validate) {
        return;
      }

      final result = await showOkCancelAlertDialog(
        context: context,
        message: i18n.feedback.confirm_sending_feedback,
        okLabel: i18n.feedback.submit,
      );

      final (data, comment) = (
        await ref.watch(feedbackDataControllerProvider.future),
        await ref.watch(feedbackCommentControllerProvider.future),
      );

      if (result == OkCancelResult.ok) {
        await submit(
          'unused this value',
          extras: MyFeedbackExtras(
            feedbackData: data,
            feedbackComment: comment,
            attachScreenshot: true,
          ).toMap(),
        );
      }
    }

    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => ElevatedButton(
          onPressed: onSubmitPressed,
          child: Text(i18n.feedback.submit),
        ),
      InheritedThemeType.cupertino => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: CupertinoButton.filled(
            onPressed: onSubmitPressed,
            child: Text(i18n.feedback.submit),
          ),
        ),
    };
  }
}
