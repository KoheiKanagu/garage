import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtag_chip.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsPageBody extends HookConsumerWidget {
  const HashtagsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hashtag = ref.watch(hashtagControllerProvider).value;

    if (hashtag == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...hashtag.hashtags.map(
                (e) => HashtagChip(
                  label: e,
                  onPressed: () {
                    ref
                        .watch(hashtagsSelectedControllerProvider.notifier)
                        .toggle(e);
                  },
                ),
              ),
              HashtagChip(
                label: core_i18n.i18n.add,
                onPressed: () async {
                  final result = await showTextInputDialog(
                    context: context,
                    title: i18n.create_new,
                    textFields: [
                      DialogTextField(
                        hintText: i18n.tamagoyaki,
                        maxLength: 64,
                        validator: (value) {
                          final isEmpty = value?.trim().isEmpty ?? true;
                          return isEmpty
                              ? core_i18n.i18n.error_field_cannot_be_empty
                              : null;
                        },
                      ),
                    ],
                  );

                  if (result == null) {
                    return;
                  }

                  ref
                      .watch(hashtagsEditControllerProvider.notifier)
                      .addTag(result.first);
                },
                icon: switch (InheritedThemeDetector.of(context)) {
                  InheritedThemeType.material => Icons.add_circle,
                  InheritedThemeType.cupertino =>
                    CupertinoIcons.add_circled_solid,
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
