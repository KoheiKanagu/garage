import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfoPage extends HookConsumerWidget {
  const UserInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          i18n.configure.user_info,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(i18n.configure.user_id),
            leading: const Icon(Icons.person_outline_rounded),
            subtitle: switch (ref.watch(firebaseUserUidProvider)) {
              AsyncData(:final value) when value != null => FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(value),
                ),
              _ => const CircularProgressIndicator.adaptive(),
            },
            trailing: IconButton(
              onPressed: () {
                showOkAlertDialog(
                  context: context,
                  message: i18n.configure.user_id_description,
                );
              },
              icon: const Icon(Icons.info_outline_rounded),
            ),
          ),
          const Divider(),
          const LinkProviderWidget(),
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
