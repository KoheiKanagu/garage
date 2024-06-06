import 'package:flutter/material.dart';

class MediaQueryPreviewSidebar extends StatelessWidget {
  const MediaQueryPreviewSidebar({
    required this.backgroundColor,
    required this.virtualKeyboard,
    required this.onVirtualKeyboardChanged,
    super.key,
  });

  final Color backgroundColor;

  final bool virtualKeyboard;

  final ValueChanged<bool> onVirtualKeyboardChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: backgroundColor,
      textStyle: DefaultTextStyle.of(context).style,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxHeight * 0.1,
              child: ListView(
                children: [
                  const Text('Virtual Keyboard'),
                  Switch.adaptive(
                    value: virtualKeyboard,
                    onChanged: onVirtualKeyboardChanged,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
