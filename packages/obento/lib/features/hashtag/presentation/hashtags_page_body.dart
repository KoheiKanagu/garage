import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtag_chip.dart';
import 'package:obento/features/hashtag/presentation/hashtags_edit_mode_list.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsPageBody extends HookConsumerWidget {
  const HashtagsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEdit = ref.watch(hashtagsEditControllerProvider) != null;
    final hashtags =
        ref.watch(hashtagControllerProvider).value?.hashtag.hashtags;

    if (hashtags == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isEdit
          ? const HashtagsEditModeList()
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...hashtags.map(
                        (e) => HashtagChip(
                          label: e,
                          onPressed: () {
                            HapticFeedback.mediumImpact();
                            ref
                                .watch(
                                  hashtagsSelectedControllerProvider.notifier,
                                )
                                .toggle(e);
                          },
                        ),
                      ),
                      _AddChip(hashtags),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _AddChip extends HookConsumerWidget {
  const _AddChip(
    this.currentHashtags,
  );

  final List<String> currentHashtags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HashtagChip(
      label: core_i18n.i18n.add,
      onPressed: () async {
        final result = await showTextInputDialog(
          context: context,
          title: i18n.create_new,
          textFields: [
            DialogTextField(
              hintText: i18n.tamagoyaki,
              maxLength: 64,
              validator: ref.watch(hashtagControllerProvider.notifier).validate,
            ),
          ],
        );

        if (result == null) {
          return;
        }

        await HapticFeedback.mediumImpact();
        await ref.watch(hashtagControllerProvider.notifier).add(result.first);
      },
      icon: switch (InheritedThemeDetector.of(context)) {
        InheritedThemeType.material => Icons.add_circle,
        InheritedThemeType.cupertino => CupertinoIcons.add_circled_solid,
      },
    );
  }
}
