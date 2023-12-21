import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/i18n/strings.g.dart';
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
    final messageFieldController = useTextEditingController(
      keys: ['messageFieldController'],
    );
    final emailFieldController = useTextEditingController(
      keys: ['emailFieldController'],
    );

    final formKey = useMemoized(
      GlobalKey<FormState>.new,
      ['formKey'],
    );

    return Form(
      key: formKey,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          const FeedbackSheetDragHandle(),
          const Gap(16),
          i18n.feedback.do_not_enter_personal_info.wrapBudouXTextStyle(
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
            controller: messageFieldController,
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return i18n.feedback.please_enter_your_feedback;
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSaved: (newValue) =>
                messageFieldController.text = newValue?.trim() ?? '',
          ),
          const Gap(16),
          i18n.feedback.input_email_if_reply_is_needed.wrapBudouXTextStyle(
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Gap(4),
          i18n.feedback.input_email_if_reply_is_needed2.wrapBudouXTextStyle(
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Gap(8),
          TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'email@example.com',
              counter: const SizedBox.shrink(),
              labelText: i18n.feedback.email_address,
            ),
            maxLength: 256,
            keyboardType: TextInputType.emailAddress,
            controller: emailFieldController,
          ),
          const Gap(32),
          i18n.feedback.device_info_collection_notice.wrapBudouXTextStyle(
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ref.watch(feedbackDeviceInfoProvider).maybeWhen(
                orElse: () => const CircularProgressIndicator.adaptive(),
                data: (data) => Column(
                  children: [
                    ListTile(
                      title: Text(i18n.feedback.os_version),
                      trailing: Text(data.osVersion),
                      dense: true,
                    ),
                    ListTile(
                      title: Text(i18n.feedback.model_name),
                      trailing: Text(data.modelName),
                      dense: true,
                    ),
                    ListTile(
                      title: Text(i18n.feedback.locale),
                      trailing: Text(data.locale),
                      dense: true,
                    ),
                  ],
                ),
              ),
          const Gap(32),
          ElevatedButton(
            onPressed: () async {
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
                final currentUser =
                    await ref.read(firebaseAuthProvider).userChanges().first;
                onSubmit(
                  FeedbackData(
                    uid: currentUser?.uid,
                    email: emailFieldController.text,
                    message: messageFieldController.text,
                    screenshotBase64: '',
                    deviceInfo:
                        await ref.read(feedbackDeviceInfoProvider.future),
                  ),
                );
              }
            },
            child: Text(i18n.feedback.submit),
          ),
        ],
      ),
    );
  }
}
