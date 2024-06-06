// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:obento/preview_device.dart';

class MediaQueryPreviewList extends StatelessWidget {
  const MediaQueryPreviewList({
    required this.previewDevices,
    required this.virtualKeyboard,
    required this.builder,
    super.key,
  });

  final List<PreviewDevice> previewDevices;

  final bool virtualKeyboard;

  final Widget Function(
    BuildContext context,
    PreviewDevice previewDevice,
  ) builder;

  static const double keyboardHeight = 214;

  static const double statusBarHeight = 24;

  static const double homeBarHeight = 34;

  EdgeInsets get padding {
    var insets = const EdgeInsets.only(
      top: statusBarHeight,
    );

    if (!virtualKeyboard) {
      insets += const EdgeInsets.only(
        bottom: homeBarHeight,
      );
    }

    return insets;
  }

  EdgeInsets get viewInsets {
    return EdgeInsets.only(
      bottom: virtualKeyboard ? keyboardHeight : 0,
    );
  }

  EdgeInsets get viewPadding {
    const insets = EdgeInsets.only(
      top: statusBarHeight,
      bottom: homeBarHeight,
    );

    return insets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: previewDevices
            .map<Widget>(
              (device) => Column(
                children: [
                  Text(device.name),
                  Text('Text Scale Factor: ${device.textScaleFactor}'),
                  const Gap(24),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: FittedBox(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.scaleDown,
                        child: LayoutBuilder(
                          builder: (_, constraints) => SizedBox.fromSize(
                            size: device.size,
                            child: Column(
                              children: [
                                Expanded(
                                  child: MediaQuery(
                                    data: MediaQueryData(
                                      platformBrightness: device.brightness,
                                      size: device.size,
                                      textScaler: TextScaler.linear(
                                        device.textScaleFactor,
                                      ),
                                      padding: padding,
                                      viewInsets: viewInsets,
                                      viewPadding: viewPadding,
                                    ),
                                    child: Stack(
                                      children: [
                                        builder(context, device),
                                        Visibility(
                                          visible: virtualKeyboard,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              color: Colors.grey,
                                              height: keyboardHeight,
                                              width: double.infinity,
                                              child: const Center(
                                                child: Text('Keyboard'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .intersperse(const Gap(32))
            .toList(),
      ),
    );
  }
}
