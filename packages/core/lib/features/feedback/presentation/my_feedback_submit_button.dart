import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/features/feedback/application/feedback_providers.dart';
import 'package:core/features/feedback/domain/feedback_data.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackSubmitButton extends HookConsumerWidget {
  const MyFeedbackSubmitButton({
    required this.onSubmit,
    super.key,
  });

  final ValueChanged<FeedbackData> onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmitPressed() async {
      final data = ref.watch(feedbackDataControllerProvider.notifier).commit();
      // validateエラーの場合はnull
      if (data == null) {
        return;
      }

      final result = await showOkCancelAlertDialog(
        context: context,
        message: i18n.feedback.confirm_sending_feedback,
        okLabel: i18n.feedback.submit,
      );

      if (result == OkCancelResult.ok) {
        onSubmit(data);
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
