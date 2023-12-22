import 'package:flutter/material.dart';

class ConfigureListTile extends StatelessWidget {
  const ConfigureListTile({
    required this.title,
    required this.onTap,
    super.key,
    this.leadingIcon,
    this.trailingIcon,
    this.isDestructiveAction = false,
  });

  final String title;

  final VoidCallback onTap;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final bool isDestructiveAction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: () {
          final style = Theme.of(context).textTheme.bodyLarge;

          if (isDestructiveAction) {
            return style?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.error,
            );
          }

          return style;
        }(),
      ),
      onTap: onTap,
      leading: () {
        if (leadingIcon == null) {
          return null;
        }

        if (isDestructiveAction) {
          return Icon(
            leadingIcon,
            color: Theme.of(context).colorScheme.error,
          );
        }

        return Icon(leadingIcon);
      }(),
      trailing: trailingIcon == null ? null : Icon(trailingIcon),
    );
  }
}
