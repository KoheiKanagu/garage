import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

class MyAuthProviderButtons extends HookConsumerWidget {
  const MyAuthProviderButtons({
    required this.header,
    required this.footers,
    super.key,
  });

  final String header;

  final List<String> footers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttons = <Widget>[
      const MyAuthProviderButton(
        type: MyAuthProviderType.apple,
      ),
      const MyAuthProviderButton(
        type: MyAuthProviderType.google,
      ),
      const MyAuthProviderButton(
        type: MyAuthProviderType.github,
      ),
    ]
        .intersperse(
          const Gap(8),
        )
        .toList();

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Column(
          children: [
            ListTile(
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(header),
              ),
              titleTextStyle:
                  Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
            ),
            ListTile(
              title: Column(
                children: buttons,
              ),
            ),
            ...footers.map(
              (e) => ListTile(
                title: Text(e),
                titleTextStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      InheritedThemeType.cupertino => CupertinoListSection.insetGrouped(
          header: header.wrapBudouXText(),
          footer: DefaultTextStyle(
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontSize: 14,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: footers
                  .map<Widget>(Text.new)
                  .intersperse(const Gap(8))
                  .toList(),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          separatorColor: Colors.transparent,
          children: buttons,
        ),
    };
  }
}
