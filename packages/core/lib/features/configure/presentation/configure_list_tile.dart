import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigureListTile extends StatelessWidget {
  const ConfigureListTile({
    required this.title,
    required this.onTap,
    this.subtitle,
    super.key,
    this.leadingIcon,
    this.leadingIconColor,
    this.trailingIcon,
    this.isDestructiveAction = false,
  });

  final String title;

  final Widget? subtitle;

  final VoidCallback onTap;

  final IconData? leadingIcon;

  final Color? leadingIconColor;

  final IconData? trailingIcon;

  final bool isDestructiveAction;

  @override
  Widget build(BuildContext context) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => ListTile(
          title: Text(
            title,
            style: isDestructiveAction
                ? Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.error,
                    )
                : Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: subtitle,
          onTap: onTap,
          leading: leadingIcon == null ? null : Icon(leadingIcon),
          iconColor: isDestructiveAction
              ? Theme.of(context).colorScheme.error
              : leadingIconColor ?? Theme.of(context).colorScheme.primary,
          trailing: trailingIcon == null ? null : Icon(trailingIcon),
          // two lines
          minTileHeight: 72,
        ),
      InheritedThemeType.cupertino => CupertinoListTile.notched(
          title: Text(
            title,
            style: isDestructiveAction
                ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.systemRed,
                    )
                : CupertinoTheme.of(context).textTheme.textStyle,
          ),
          subtitle: subtitle,
          onTap: onTap,
          leading: leadingIcon == null
              ? null
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CupertinoColors.systemGroupedBackground
                        .resolveFrom(context),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Icon(
                    leadingIcon,
                    color: isDestructiveAction
                        ? CupertinoColors.systemRed
                        : leadingIconColor,
                  ),
                ),
          trailing: trailingIcon == null
              ? const CupertinoListTileChevron()
              : Icon(trailingIcon),
        ),
    };
  }
}
