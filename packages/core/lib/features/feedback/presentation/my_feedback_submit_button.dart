import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
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
    final themeType = InheritedThemeDetector.of(context);

    Future<void> onSubmitPressed() async {
      final state = feedbackFormKey.currentState;
      state?.save();

      final validate = state?.validate() ?? false;
      if (!validate) {
        return;
      }

      final result = await showOkCancelAlertDialog(
        context: context,
        message: i18n.feedback.confirm_sending_feedback,
        okLabel: i18n.feedback.submit,
        useRootNavigator: false,
      );

      if (result == OkCancelResult.ok) {
        final (data, comment, attachScreenshot) = (
          await ref.watch(feedbackDataControllerProvider.future),
          await ref.watch(feedbackCommentControllerProvider.future),
          ref.watch(feedbackAttachScreenshotControllerProvider),
        );

        if (context.mounted) {
          final indicator = showMyProgressIndicator(
            context: context,
          );

          try {
            await submit(
              'unused this value',
              extras: FeedbackExtras(
                feedbackData: data,
                feedbackComment: comment,
                attachScreenshot: attachScreenshot,
              ).toMap(),
            );
          } finally {
            indicator.dismiss();
          }
        }
      }
    }

    return switch (themeType) {
      InheritedThemeType.material => FilledButton(
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
