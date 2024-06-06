import 'package:flutter/material.dart';
import 'package:obento/media_query_preview_list.dart';
import 'package:obento/media_query_preview_sidebar.dart';
import 'package:obento/preview_device.dart';

class MediaQueryPreview extends StatefulWidget {
  const MediaQueryPreview({
    required this.previewDevices,
    required this.builder,
    super.key,
    // Default background color is the same as Flutter's brand color
    // https://flutter.dev/brand
    this.backgroundColor = const Color(0xFF042B59),

    // If not provided, the text color is automatically determined based on the
    // background color's luminance
    this.textColor,

    // If true, the virtual keyboard is shown
    this.virtualKeyboard = false,
  });

  final List<PreviewDevice> previewDevices;

  final Color backgroundColor;

  final Color? textColor;

  final bool virtualKeyboard;

  final Widget Function(
    BuildContext context,
    PreviewDevice previewDevice,
  ) builder;

  @override
  State<MediaQueryPreview> createState() => _MediaQueryPreviewState();
}

class _MediaQueryPreviewState extends State<MediaQueryPreview> {
  bool virtualKeyboard = false;

  @override
  void initState() {
    virtualKeyboard = widget.virtualKeyboard;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.previewDevices.isNotEmpty, 'previewDevices is empty');

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: DefaultTextStyle(
          style: TextStyle(
            color: widget.textColor ??
                (widget.backgroundColor.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white),
          ),
          child: Row(
            children: [
              MediaQueryPreviewSidebar(
                backgroundColor: widget.backgroundColor,
                virtualKeyboard: virtualKeyboard,
                onVirtualKeyboardChanged: (value) {
                  setState(() {
                    virtualKeyboard = value;
                  });
                },
              ),
              Expanded(
                child: MediaQueryPreviewList(
                  previewDevices: widget.previewDevices,
                  virtualKeyboard: virtualKeyboard,
                  builder: widget.builder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
