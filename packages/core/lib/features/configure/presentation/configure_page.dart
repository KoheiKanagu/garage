import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/features/feedback/application/feedback_providers.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

class ConfigurePage extends HookConsumerWidget {
  const ConfigurePage({
    required this.additionalItems,
    super.key,
  });

  final List<ConfigureItem> additionalItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.configure.title),
      ),
      body: ListView(
        children: [
          ConfigureListTile(
            title: i18n.configure.feedback,
            onTap: () {
              BetterFeedback.of(context).show(
                (feedback) async {
                  await ref.read(feedbackSubmitProvider(feedback).future);

                  if (context.mounted) {
                    await showOkAlertDialog(
                      context: context,
                      message: i18n.feedback.thank_you_for_your_feedback,
                    );
                  }

                  if (context.mounted) {
                    BetterFeedback.of(context).hide();
                  }
                },
              );
            },
          ),
          ConfigureListTile(
            title: i18n.configure.review_app,
            onTap: () {
              InAppReview.instance.openStoreListing(
                appStoreId: kAppStoreId,
              );
            },
          ),
          ConfigureListTile(
            title: i18n.configure.about_this_app,
            onTap: () {
              const AboutThisAppPageRoute().push<void>(context);
            },
          ),
        ],
      ),
    );
  }
}
