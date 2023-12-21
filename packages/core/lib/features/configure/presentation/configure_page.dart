import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core/features/feedback/domain/feedback_from.dart';
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
