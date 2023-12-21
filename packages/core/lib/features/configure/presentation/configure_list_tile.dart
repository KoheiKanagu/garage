import 'package:flutter/material.dart';

class ConfigureListTile extends StatelessWidget {
  const ConfigureListTile({
    required this.title,
    required this.onTap,
    super.key,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String title;

  final VoidCallback onTap;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      leading: leadingIcon == null ? null : Icon(leadingIcon),
      trailing: Icon(
        trailingIcon ?? Icons.adaptive.arrow_forward,
      ),
    );
  }
}
