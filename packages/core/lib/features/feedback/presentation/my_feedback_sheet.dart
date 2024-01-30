import 'package:core/core.dart';
import 'package:core/features/feedback/presentation/my_feedback_submit_button.dart';
import 'package:core/features/feedback/presentation/my_feedback_type_picker_field.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
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
    final themeType = InheritedThemeDetector.of(context);

    return Form(
      key: FeedbackDataController.formKey,
      child: switch (themeType) {
        InheritedThemeType.material => ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              const FeedbackSheetDragHandle(),
              const Gap(16),
              const MyFeedbackTypePickerField(),
              const Gap(28),
              const MyFeedbackMessageField(),
              const Gap(28),
              const MyFeedbackEmailField(),
              const Gap(28),
              const MyFeedbackDeviceInfoField(),
              const Gap(28),
              MyFeedbackSubmitButton(onSubmit: onSubmit),
            ],
          ),
        InheritedThemeType.cupertino => ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            padding: EdgeInsets.only(
              top: 16,
              // SafeArea
              bottom: MediaQuery.of(context).padding.bottom + 32,
            ),
            children: [
              const FeedbackSheetDragHandle(),
              const MyFeedbackTypePickerField(),
              const MyFeedbackMessageField(),
              const MyFeedbackEmailField(),
              const MyFeedbackDeviceInfoField(),
              const Gap(28),
              MyFeedbackSubmitButton(onSubmit: onSubmit),
            ],
          ),
      },
    );
  }
}
