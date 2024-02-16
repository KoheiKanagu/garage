import 'dart:io';

import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedRunAppPage extends StatelessWidget {
  const FailedRunAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeType = (Platform.isIOS || Platform.isMacOS)
        ? InheritedThemeType.cupertino
        : InheritedThemeType.material;

    return switch (themeType) {
      InheritedThemeType.material => MaterialApp(
          supportedLocales: AppLocaleUtils.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const FailedRunAppPageHome(),
        ),
      InheritedThemeType.cupertino => CupertinoApp(
          supportedLocales: AppLocaleUtils.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const FailedRunAppPageHome(),
        ),
    };
  }
}

class FailedRunAppPageHome extends StatelessWidget {
  const FailedRunAppPageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeType = InheritedThemeDetector.of(context);

    final body = Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(i18n.failed_run_app.title),
          const Divider(),
          Text(i18n.failed_run_app.description),
          switch (themeType) {
            InheritedThemeType.material => TextButton(
                onPressed: () => exit(0),
                child: Text(
                  i18n.failed_run_app.exit,
                  textAlign: TextAlign.center,
                ),
              ),
            InheritedThemeType.cupertino => CupertinoButton(
                onPressed: () => exit(0),
                child: Text(
                  i18n.failed_run_app.exit,
                  textAlign: TextAlign.center,
                ),
              ),
          },
        ],
      ),
    );

    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          body: body,
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          child: body,
        ),
    };
  }
}
