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
              const LinkProviderWidget(),
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
              const LinkProviderWidget(),
              CupertinoListSection.insetGrouped(
                children: children2,
              ),
            ],
          ),
        ),
    };
  }
}
