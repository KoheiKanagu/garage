import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkProviderWidget extends HookConsumerWidget {
  const LinkProviderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Column(
          children: [
            ListTile(
              title: i18n.configure.link_account.wrapBudouXText(
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: MyOauthProviderButtons(),
            ),
            ListTile(
              subtitle:
                  i18n.configure.link_account_description.wrapBudouXText(),
            ),
            ListTile(
              subtitle:
                  i18n.configure.link_account_description2.wrapBudouXText(),
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoListSection.insetGrouped(
          header: Text(i18n.configure.link_account),
          footer: DefaultTextStyle(
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 14,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                i18n.configure.link_account_description.wrapBudouXText(),
                const Text(''),
                i18n.configure.link_account_description2.wrapBudouXText(),
              ],
            ),
          ),
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: MyOauthProviderButtons(),
            ),
          ],
        ),
    };
  }
}
