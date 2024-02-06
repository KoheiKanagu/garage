import 'dart:io';

import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServiceDownPage extends HookConsumerWidget {
  const ServiceDownPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(i18n.service_down.title),
                const Divider(),
                Text(i18n.service_down.description),
                TextButton(
                  onPressed: () => exit(0),
                  child: Text(i18n.service_down.exit),
                ),
              ],
            ),
          ),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(i18n.service_down.title),
                const Divider(),
                Text(i18n.service_down.description),
                CupertinoButton(
                  onPressed: () => exit(0),
                  child: Text(i18n.service_down.exit),
                ),
              ],
            ),
          ),
        )
    };
  }
}
