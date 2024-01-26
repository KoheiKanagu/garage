import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final children1 = [
      ConfigureListTile(
        title: i18n.configure.user_info,
        onTap: () {
          const UserInfoPageRoute().push<void>(context);
        },
        leadingIcon: Icons.person,
      ),
      ...additionalItems.whereNot((e) => e.forDebug).map(
            (e) => ConfigureListTile(
              title: e.text,
              onTap: e.onTap,
              trailingIcon: e.trailingIcon,
              leadingIcon: e.leadingIcon,
            ),
          ),
    ];

    final children2 = [
      ConfigureListTile(
        title: i18n.configure.feedback,
        leadingIcon: Icons.feedback,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.purple,
          InheritedThemeType.cupertino => CupertinoColors.systemPurple,
        },
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
        leadingIcon: Icons.star,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.orange,
          InheritedThemeType.cupertino => CupertinoColors.activeOrange,
        },
        onTap: () {
          InAppReview.instance.openStoreListing(
            appStoreId: kAppStoreId,
          );
        },
      ),
      ConfigureListTile(
        title: i18n.configure.about_this_app,
        leadingIcon: Icons.info,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.blue,
          InheritedThemeType.cupertino => CupertinoColors.activeBlue,
        },
        onTap: () {
          const AboutThisAppPageRoute().push<void>(context);
        },
      ),
    ];

    final children3 = [
      if (kDebugMode)
        ...additionalItems.where((e) => e.forDebug).map(
              (e) => ConfigureListTile(
                title: '[debug] ${e.text}',
                onTap: e.onTap,
                leadingIcon: Icons.bug_report,
              ),
            ),
      const _DebugListTiles(),
    ];

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            title: Text(i18n.configure.title),
          ),
          body: ListView(
            children: [
              ...children1,
              const Divider(),
              ...children2,
              const Divider(),
              ...children3,
            ],
          ),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          navigationBar: CupertinoNavigationBar(
            middle: Text(i18n.configure.title),
          ),
          child: ListView(
            children: [
              CupertinoListSection.insetGrouped(
                children: children1,
              ),
              CupertinoListSection.insetGrouped(
                children: children2,
              ),
              CupertinoListSection.insetGrouped(
                children: children3,
              ),
            ],
          ),
        ),
    };
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
          leadingIcon: Icons.bug_report,
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
          leadingIcon: Icons.bug_report,
        ),
        ConfigureListTile(
          title: '[debug] go /',
          onTap: () {
            GoRouter.of(context).go('/');
          },
          leadingIcon: Icons.bug_report,
        ),
      ],
    );
  }
}
