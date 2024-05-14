import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsEditModeList extends HookConsumerWidget {
  const HashtagsEditModeList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashtags = ref.watch(hashtagsEditControllerProvider)?.hashtags ?? [];

    final themeType = InheritedThemeDetector.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: switch (themeType) {
          InheritedThemeType.cupertino =>
            MediaQuery.of(context).viewPadding.top +
                kMinInteractiveDimensionCupertino,
          _ => 0,
        },
      ),
      child: ReorderableListView.builder(
        onReorder: ref.watch(hashtagsEditControllerProvider.notifier).swap,
        onReorderStart: (_) => HapticFeedback.lightImpact(),
        onReorderEnd: (_) => HapticFeedback.lightImpact(),
        buildDefaultDragHandles: false,
        itemCount: hashtags.length,
        itemBuilder: (context, index) {
          final e = hashtags[index];

          Future<void> onDelete() async {
            final result = await showOkCancelAlertDialog(
              context: context,
              title: i18n.delete_hashtag(
                hashtag: hashtags[index],
              ),
              okLabel: core_i18n.i18n.delete,
              isDestructiveAction: true,
            );

            if (result == OkCancelResult.ok) {
              ref.watch(hashtagsEditControllerProvider.notifier).delete(index);
            }
          }

          final key = ValueKey('Hashtag_$e-$index');

          return switch (themeType) {
            InheritedThemeType.material => ListTile(
                key: key,
                title: Text(e),
                leading: IconButton(
                  onPressed: () async => onDelete(),
                  icon: Icon(
                    Icons.remove_circle,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: Icon(
                    Icons.drag_handle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            InheritedThemeType.cupertino => CupertinoListTile(
                key: key,
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                title: Text(e),
                leading: CupertinoButton(
                  onPressed: () async => onDelete(),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    CupertinoIcons.delete_solid,
                    color: CupertinoColors.systemRed.resolveFrom(context),
                  ),
                ),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: const Icon(CupertinoIcons.bars),
                ),
              ),
          };
        },
      ),
    );
  }
}
