import 'dart:ui';

class ConfigureItem {
  const ConfigureItem({
    required this.text,
    required this.onTap,
    required this.forDebug,
  });

  final String text;

  final VoidCallback onTap;

  final bool forDebug;
}
