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

    return SafeArea(
      bottom: false,
      child: ReorderableListView.builder(
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom,
        ),
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
                leading: _LeadingIcon(onDelete),
                trailing: _TrailingIcon(index),
                contentPadding: EdgeInsets.zero,
              ),
            InheritedThemeType.cupertino => CupertinoListTile(
                key: key,
                backgroundColor:
                    CupertinoColors.systemBackground.resolveFrom(context),
                title: Text(e),
                leadingSize: _LeadingIcon.size,
                leading: _LeadingIcon(onDelete),
                trailing: _TrailingIcon(index),
              ),
          };
        },
      ),
    );
  }
}

class _TrailingIcon extends HookConsumerWidget {
  const _TrailingIcon(
    this.index,
  );

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return ReorderableDragStartListener(
      index: index,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: switch (themeType) {
          InheritedThemeType.material => Icon(
              Icons.drag_handle,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          InheritedThemeType.cupertino => const Icon(
              CupertinoIcons.bars,
              size: 24,
            ),
        },
      ),
    );
  }
}

class _LeadingIcon extends HookConsumerWidget {
  const _LeadingIcon(
    this.onPressed,
  );

  final VoidCallback onPressed;

  static const double size = 24 + 16 + 16;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: switch (themeType) {
          InheritedThemeType.material => Icon(
              Icons.remove_circle,
              color: Theme.of(context).colorScheme.error,
              size: 24,
            ),
          InheritedThemeType.cupertino => Icon(
              CupertinoIcons.delete_solid,
              color: CupertinoColors.systemRed.resolveFrom(context),
              size: 24,
            ),
        },
      ),
    );
  }
}
