import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = [
      ConfigureListTile(
        title: i18n.configure.terms_of_service,
        onTap: () async {
          final url = await ref.read(configureTermsOfServiceUriProvider.future);

          if (url != null) {
            await launchUrl(url);
          }
        },
        leadingIcon: Icons.description,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.blue,
          InheritedThemeType.cupertino => CupertinoColors.systemBlue,
        },
      ),
      ConfigureListTile(
        title: i18n.configure.privacy_policy,
        onTap: () async {
          final url = await ref.read(configurePrivacyPolicyUriProvider.future);

          if (url != null) {
            await launchUrl(url);
          }
        },
        leadingIcon: Icons.privacy_tip,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.green,
          InheritedThemeType.cupertino => CupertinoColors.systemGreen,
        },
      ),
      ConfigureListTile(
        title: i18n.configure.license,
        onTap: () {
          const MyLicensePageRoute().push<void>(context);
        },
        leadingIcon: Icons.library_books,
        leadingIconColor: switch (InheritedThemeDetector.of(context)) {
          InheritedThemeType.material => Colors.purple,
          InheritedThemeType.cupertino => CupertinoColors.systemPurple,
        },
      ),
    ];

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            title: Text(i18n.configure.about_this_app),
          ),
          body: ListView(
            children: children,
          ),
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemGroupedBackground,
          navigationBar: CupertinoNavigationBar(
            middle: Text(i18n.configure.about_this_app),
            previousPageTitle: i18n.configure.title,
          ),
          child: ListView(
            children: [
              CupertinoListSection.insetGrouped(
                children: children,
              ),
            ],
          ),
        ),
    };
  }
}
