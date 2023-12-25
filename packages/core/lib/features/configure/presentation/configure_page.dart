import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/foundation.dart';
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
            title: i18n.configure.user_info,
            onTap: () {
              const UserInfoPageRoute().push<void>(context);
            },
            leadingIcon: Icons.person_outline_rounded,
            trailingIcon: Icons.adaptive.arrow_forward_rounded,
          ),
          ...additionalItems.whereNot((e) => e.forDebug).map(
                (e) => ConfigureListTile(
                  title: e.text,
                  onTap: e.onTap,
                  trailingIcon: e.trailingIcon,
                  leadingIcon: e.leadingIcon,
                ),
              ),
          if (kDebugMode)
            ...additionalItems.where((e) => e.forDebug).map(
                  (e) => ConfigureListTile(
                    title: '[debug]${e.text}',
                    onTap: e.onTap,
                    trailingIcon: e.trailingIcon,
                    leadingIcon: e.leadingIcon,
                  ),
                ),
          if (kDebugMode) ...[
            ConfigureListTile(
              title: '[debug] SignOut',
              onTap: () => ref.read(firebaseAuthProvider).signOut(),
              leadingIcon: Icons.logout,
              trailingIcon: Icons.warning_rounded,
            ),
            ConfigureListTile(
              title: '[debug] clear SharedPreferences',
              onTap: () async {
                await ref.read(sharedPreferencesClearProvider.future);
                logger.w('cleared SharedPreferences');
              },
              leadingIcon: Icons.clear_all,
              trailingIcon: Icons.warning_rounded,
            ),
          ],
          const Divider(),
          ConfigureListTile(
            title: i18n.configure.feedback,
            leadingIcon: Icons.feedback_outlined,
            trailingIcon: Icons.adaptive.arrow_forward_rounded,
            onTap: () {
              showMyBetterFeedback(
                context,
                ref,
                from: FeedbackFrom.configure,
              );
            },
          ),
          ConfigureListTile(
            title: i18n.configure.review_app,
            leadingIcon: Icons.star_outline_rounded,
            trailingIcon: Icons.adaptive.arrow_forward_rounded,
            onTap: () {
              InAppReview.instance.openStoreListing(
                appStoreId: kAppStoreId,
              );
            },
          ),
          ConfigureListTile(
            title: i18n.configure.about_this_app,
            leadingIcon: Icons.info_outline_rounded,
            trailingIcon: Icons.adaptive.arrow_forward_rounded,
            onTap: () {
              const AboutThisAppPageRoute().push<void>(context);
            },
          ),
          const Divider(),
          ConfigureListTile(
            title: i18n.configure.delete_all,
            leadingIcon: Icons.delete_forever_outlined,
            isDestructiveAction: true,
            onTap: () async {
              final result = await showOkCancelAlertDialog(
                context: context,
                title: i18n.configure.delete_all,
                message: i18n.configure.delete_all_description,
                okLabel: MaterialLocalizations.of(context).deleteButtonTooltip,
                isDestructiveAction: true,
              );
              if (result != OkCancelResult.ok) {
                return;
              }

              final indicator = showMyProgressIndicator();
              await ref.read(firebaseUserDeleteProvider.future);
              indicator.dismiss();

              if (context.mounted) {
                await showOkAlertDialog(
                  context: context,
                  title: i18n.configure.delete_complete,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
