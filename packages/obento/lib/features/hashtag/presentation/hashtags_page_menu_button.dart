import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_strings;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/gen/strings.g.dart';
import 'package:pull_down_button/pull_down_button.dart';

class HashtagsPageMenuButton extends HookConsumerWidget {
  const HashtagsPageMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => PopupMenuButton(
          iconColor: Theme.of(context).colorScheme.primary,
          itemBuilder: (context) {
            final configure = core_strings.i18n.configure.title;
            final edit = core_strings.i18n.edit;

            return [
              PopupMenuItem(
                value: i18n.deselect_all,
                child: Text(i18n.deselect_all),
              ),
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
            if (value == i18n.deselect_all) {
              ref
                  .watch(hashtagsSelectedControllerProvider.notifier)
                  .deselectAll();
            }

            if (value == core_strings.i18n.edit) {
              ref.watch(hashtagsEditControllerProvider.notifier).edit();
            }

            if (value == core_strings.i18n.configure.title) {
              const ConfigurePageRoute().push<void>(context);
            }
          },
        ),
      InheritedThemeType.cupertino => PullDownButton(
          itemBuilder: (context) => [
            PullDownMenuItem(
              onTap: () {
                ref
                    .watch(hashtagsSelectedControllerProvider.notifier)
                    .deselectAll();
              },
              title: i18n.deselect_all,
              icon: CupertinoIcons.refresh,
            ),
            PullDownMenuItem(
              onTap: () {
                ref.watch(hashtagsEditControllerProvider.notifier).edit();
              },
              title: core_strings.i18n.edit,
              icon: CupertinoIcons.pencil,
            ),
            PullDownMenuItem(
              onTap: () {
                const ConfigurePageRoute().push<void>(context);
              },
              title: core_strings.i18n.configure.title,
              icon: CupertinoIcons.settings,
            ),
          ],
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.ellipsis_circle),
          ),
        ),
    };
  }
}
