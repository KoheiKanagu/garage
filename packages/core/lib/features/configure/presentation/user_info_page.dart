import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfoPage extends HookConsumerWidget {
  const UserInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children1 = [
      ConfigureListTile(
        title: i18n.configure.user_id,
        subtitle: switch (ref.watch(firebaseUserUidProvider)) {
          AsyncData(:final value) when value != null => FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Text(value),
            ),
          _ => const CircularProgressIndicator.adaptive(),
        },
        leadingIcon: Icons.person,
        onTap: () {
          showOkAlertDialog(
            context: context,
            message: i18n.configure.user_id_description,
          );
        },
      ),
    ];

    final children2 = [
      ConfigureListTile(
        title: i18n.auth.sign_out,
        leadingIcon: Icons.logout,
        isDestructiveAction: true,
        onTap: () async {
          final result = await showOkCancelAlertDialog(
            context: context,
            title: i18n.auth.sign_out,
            message: i18n.auth.sign_out_description,
            okLabel: i18n.auth.sign_out,
            isDestructiveAction: true,
          );
          if (result != OkCancelResult.ok) {
            return;
          }

          if (context.mounted) {
            final indicator = showMyProgressIndicator(
              context: context,
            );
            await ref.watch(firebaseUserSignOutProvider.future);
            indicator.dismiss();
          }

          if (context.mounted) {
            await showOkAlertDialog(
              context: context,
              title: i18n.auth.sign_out_complete,
            );
          }
        },
      ),
      ConfigureListTile(
        title: i18n.configure.delete_all,
        leadingIcon: Icons.delete_forever,
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

          if (context.mounted) {
            final indicator = showMyProgressIndicator(
              context: context,
            );
            await ref.watch(firebaseUserDeleteProvider.future);
            indicator.dismiss();
          }

          if (context.mounted) {
            await showOkAlertDialog(
              context: context,
              title: i18n.configure.delete_complete,
            );
          }
        },
      ),
    ];

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            title: Text(i18n.configure.user_info),
          ),
          body: ListView(
            children: [
              ...children1,
              const Divider(),
              MyAuthProviderButtons(
                header: i18n.configure.link_account,
                footers: [
                  i18n.configure.link_account_description,
                  i18n.configure.link_account_description2,
                ],
              ),
              const Divider(),
              ...children2,
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
              MyAuthProviderButtons(
                header: i18n.configure.link_account,
                footers: [
                  i18n.configure.link_account_description,
                  i18n.configure.link_account_description2,
                ],
              ),
              CupertinoListSection.insetGrouped(
                children: children2,
              ),
            ],
          ),
        ),
    };
  }
}
