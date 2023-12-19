import 'package:flutter/material.dart';

class ConfigureListTile extends StatelessWidget {
  const ConfigureListTile({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: Icon(
        Icons.adaptive.arrow_forward,
      ),
    );
  }
}
