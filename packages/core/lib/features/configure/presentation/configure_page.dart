import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

class ConfigurePage extends HookConsumerWidget {
  const ConfigurePage({
    required this.additionalItems,
    @visibleForTesting this.enableDebugItems = true,
    super.key,
  });

  final List<ConfigureItem> additionalItems;

  @visibleForTesting
  final bool enableDebugItems;

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

    final debugTiles = [
      ...additionalItems.where((e) => e.forDebug).map(
            (e) => _DebugListTile(
              title: e.text,
              onTap: e.onTap,
            ),
          ),
      _DebugListTile(
        title: 'go /',
        onTap: () {
          GoRouter.of(context).go('/');
        },
      ),
      _DebugListTile(
        title: 'disableRouterRedirect',
        onTap: () async {
          final result = await showOkCancelAlertDialog(
            context: context,
            title: 'disableRouterRedirect?',
          );
          if (result == OkCancelResult.ok) {
            disableRouterRedirect = true;
            logger.fine('disableRouterRedirect');
          }
        },
      ),
      _DebugListTile(
        title: 'SignOut',
        onTap: () async {
          final result = await showOkCancelAlertDialog(
            context: context,
            title: 'SignOut?',
          );

          if (result == OkCancelResult.ok) {
            await ref.watch(firebaseAuthProvider).signOut();
            logger.fine('SignOut');
          }
        },
      ),
      _DebugListTile(
        title: 'clear SharedPreferences',
        onTap: () async {
          final result = await showOkCancelAlertDialog(
            context: context,
            title: 'clear SharedPreferences?',
          );

          if (result == OkCancelResult.ok) {
            await ref
                .read(sharedPreferencesControllerProvider.notifier)
                .clear();
          }
        },
      ),
      _DebugListTile(
        title: 'openAdInspector',
        onTap: () {
          MobileAds.instance.openAdInspector(
            (error) {
              if (error != null) {
                logger.severe(
                  {
                    'message': 'openAdInspector',
                    'error': {
                      'code': error.code,
                      'domain': error.domain,
                      'message': error.message,
                    },
                  },
                );
              }
            },
          );
        },
      ),
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
              if (kDebugMode && enableDebugItems) ...[
                const Divider(),
                ...debugTiles,
              ],
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
              if (kDebugMode && enableDebugItems)
                CupertinoListSection.insetGrouped(
                  children: debugTiles,
                ),
            ],
          ),
        ),
    };
  }
}

class _DebugListTile extends ConfigureListTile {
  const _DebugListTile({
    required super.title,
    required super.onTap,
  }) : super(
          leadingIcon: Icons.bug_report,
        );
}
