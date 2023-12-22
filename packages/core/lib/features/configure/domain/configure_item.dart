import 'package:flutter/material.dart';

class ConfigureItem {
  const ConfigureItem({
    required this.text,
    required this.onTap,
    required this.forDebug,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String text;

  final VoidCallback onTap;

  final bool forDebug;

  final IconData? leadingIcon;

  final IconData? trailingIcon;
}
