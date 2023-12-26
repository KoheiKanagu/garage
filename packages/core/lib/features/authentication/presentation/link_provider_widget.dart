import 'package:core/core.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkProviderWidget extends HookConsumerWidget {
  const LinkProviderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ListTile(
          title: i18n.configure.link_account.wrapBudouXText(
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: i18n.configure.link_account_description.wrapBudouXText(),
        ),
        ListTile(
          subtitle: i18n.configure.link_account_description2.wrapBudouXText(),
        ),
        const MyOauthProviderButtons(),
      ],
    );
  }
}
