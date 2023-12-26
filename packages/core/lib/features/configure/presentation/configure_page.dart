import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core/features/onboarding/application/onboarding_route.dart';
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
          const _DebugListTiles(),
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
        ],
      ),
    );
  }
}

class _DebugListTiles extends HookConsumerWidget {
  const _DebugListTiles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!kDebugMode) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ConfigureListTile(
          title: '[debug] SignOut',
          onTap: () async {
            final result = await showOkCancelAlertDialog(
              context: context,
              title: 'SignOut?',
            );

            if (result == OkCancelResult.ok) {
              await ref.read(firebaseAuthProvider).signOut();
              logger.d('SignOut');
            }
          },
          leadingIcon: Icons.logout,
          trailingIcon: Icons.warning_rounded,
        ),
        ConfigureListTile(
          title: '[debug] clear SharedPreferences',
          onTap: () async {
            final result = await showOkCancelAlertDialog(
              context: context,
              title: 'clear SharedPreferences?',
            );

            if (result == OkCancelResult.ok) {
              await ref.read(sharedPreferencesClearProvider.future);
              logger.d('clear SharedPreferences');
            }
          },
          leadingIcon: Icons.clear_all,
          trailingIcon: Icons.warning_rounded,
        ),
        ConfigureListTile(
          title: '[debug] go ${const OnboardingPageRoute().location}',
          onTap: () {
            const OnboardingPageRoute().go(context);
          },
          leadingIcon: Icons.start_rounded,
          trailingIcon: Icons.warning_rounded,
        ),
      ],
    );
  }
}
