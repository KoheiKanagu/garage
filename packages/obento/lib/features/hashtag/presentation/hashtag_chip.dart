import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';

class HashtagChip extends HookConsumerWidget {
  const HashtagChip({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String label;

  final VoidCallback onPressed;

  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected =
        ref.watch(hashtagsSelectedControllerProvider).contains(label);

    final themeType = InheritedThemeDetector.of(context);

    final Icon leadingIcon;
    if (icon == null) {
      leadingIcon = switch (themeType) {
        InheritedThemeType.material => isSelected
            ? const Icon(Icons.check_circle)
            : const Icon(Icons.check_circle_outline),
        InheritedThemeType.cupertino => isSelected
            ? const Icon(CupertinoIcons.check_mark_circled_solid)
            : const Icon(CupertinoIcons.check_mark_circled),
      };
    } else {
      leadingIcon = Icon(icon);
    }

    return switch (themeType) {
      InheritedThemeType.material => ActionChip(
          label: Text(label),
          avatar: leadingIcon,
          onPressed: onPressed,
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
              : Theme.of(context).colorScheme.onPrimary,
          side: BorderSide(
            width: 2,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
      InheritedThemeType.cupertino => FittedBox(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.3,
                color: CupertinoColors.white,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: isSelected
                      ? CupertinoTheme.of(context).primaryColor
                      : CupertinoTheme.of(context)
                          .primaryColor
                          .withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(8),
                color: isSelected
                    ? CupertinoTheme.of(context).primaryColor.withOpacity(0.1)
                    : CupertinoTheme.of(context).primaryContrastingColor,
              ),
              child: CupertinoButton(
                onPressed: onPressed,
                child: Row(
                  children: [
                    leadingIcon,
                    const Gap(8),
                    Text(
                      label,
                      style: TextStyle(
                        color: const CupertinoDynamicColor.withBrightness(
                          color: CupertinoColors.black,
                          darkColor: CupertinoColors.white,
                        ).resolveFrom(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    };
  }
}
