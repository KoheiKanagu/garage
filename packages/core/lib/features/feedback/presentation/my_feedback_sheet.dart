import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyFeedbackSheet extends HookConsumerWidget {
  const MyFeedbackSheet({
    required this.onSubmit,
    required this.scrollController,
    super.key,
  });

  final void Function(FeedbackData data) onSubmit;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(
      GlobalKey<FormState>.new,
      ['formKey'],
    );

    final emailFieldController = useTextEditingController(
      keys: ['emailFieldController'],
    );

    final messageFieldController = useTextEditingController(
      keys: ['messageFieldController'],
    );

    final themeType = InheritedThemeDetector.of(context);

    Future<void> onSubmitPressed() async {
      // validation error
      formKey.currentState?.save();
      if (!(formKey.currentState?.validate() ?? false)) {
        return;
      }

      final result = await showOkCancelAlertDialog(
        context: context,
        message: i18n.feedback.confirm_sending_feedback,
        okLabel: i18n.feedback.submit,
      );

      if (result == OkCancelResult.ok) {
        final currentUser = await ref.read(firebaseUserProvider.future);
        onSubmit(
          FeedbackData(
            uid: currentUser?.uid,
            email: emailFieldController.text,
            message: messageFieldController.text,
            deviceInfo: await ref.read(feedbackDeviceInfoProvider.future),
            type: FeedbackType.impression,
          ),
        );
      }
    }

    return Form(
      key: formKey,
      child: switch (themeType) {
        InheritedThemeType.material => ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              const FeedbackSheetDragHandle(),
              MyFeedbackMessageField(
                controller: messageFieldController,
              ),
              const Gap(16),
              MyFeedbackEmailField(
                controller: emailFieldController,
              ),
              const Gap(16),
              const MyFeedbackDeviceInfoField(),
              const Gap(16),
              ElevatedButton(
                onPressed: onSubmitPressed,
                child: Text(i18n.feedback.submit),
              ),
            ],
          ),
        InheritedThemeType.cupertino => ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            children: [
              const FeedbackSheetDragHandle(),
              const MyFeedbackBugReportCheckBox(),
              MyFeedbackMessageField(
                controller: messageFieldController,
              ),
              MyFeedbackEmailField(
                controller: emailFieldController,
              ),
              const MyFeedbackDeviceInfoField(),
              // CupertinoButton.filled(
              //   onPressed: onSubmitPressed,
              //   child: Text(i18n.feedback.submit),
              // ),
            ],
          ),
      },
    );
  }
}
