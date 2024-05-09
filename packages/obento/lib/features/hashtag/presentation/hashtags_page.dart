import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_body.dart';
import 'package:pull_down_button/pull_down_button.dart';

class HashtagsPage extends HookConsumerWidget {
  const HashtagsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                iconColor: Theme.of(context).colorScheme.primary,
                itemBuilder: (context) {
                  final configure = i18n.configure.title;
                  final edit = i18n.edit;

                  return [
                    PopupMenuItem(
                      value: edit,
                      child: Text(edit),
                    ),
                    PopupMenuItem(
                      value: configure,
                      child: Text(configure),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == i18n.configure.title) {
                    const ConfigurePageRoute().push<void>(context);
                  }

                  if (value == i18n.edit) {
                    // TODO: edit state
                  }
                },
              ),
            ],
          ),
          body: const HashtagsPageBody()),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            trailing: PullDownButton(
              itemBuilder: (context) {
                return [
                  PullDownMenuItem(
                    onTap: () {
                      // TODO: edit state
                    },
                    title: i18n.edit,
                    icon: CupertinoIcons.pencil,
                  ),
                  PullDownMenuItem(
                    onTap: () {
                      const ConfigurePageRoute().push<void>(context);
                    },
                    title: i18n.configure.title,
                    icon: CupertinoIcons.settings,
                  ),
                ];
              },
              buttonBuilder: (context, showMenu) => CupertinoButton(
                onPressed: showMenu,
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.ellipsis_circle),
              ),
            ),
          ),
          child: const HashtagsPageBody(),
        ),
    };
  }
}
