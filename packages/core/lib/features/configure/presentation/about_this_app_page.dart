import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/features/ads/application/ads_providers.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section1 = [
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
        title: i18n.configure.licenses,
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

    final section2 = [
      // 同意済みの場合のみ表示
      if (ref.watch(adsConsentStatusProvider).asData?.value ==
          ConsentStatus.obtained)
        ConfigureListTile(
          title: i18n.ads.revoke_personalized.request_label,
          leadingIcon: Icons.remove_red_eye,
          leadingIconColor: switch (InheritedThemeDetector.of(context)) {
            InheritedThemeType.material => Colors.red,
            InheritedThemeType.cupertino => CupertinoColors.systemRed,
          },
          onTap: () async {
            final result = await showOkCancelAlertDialog(
              context: context,
              title: i18n.ads.revoke_personalized.title,
              okLabel: i18n.ads.revoke_personalized.ok_label,
            );

            if (result == OkCancelResult.ok) {
              await ref.read(adsResetConsentStatusProvider.future);
              if (context.mounted) {
                await showOkAlertDialog(
                  context: context,
                  title: i18n.ads.revoke_personalized.did_revoke_title,
                );
              }
            }
          },
        ),
    ];

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => Scaffold(
          appBar: AppBar(
            title: Text(i18n.configure.about_this_app),
          ),
          body: ListView(
            children: [
              ...section1,
              if (section2.isNotEmpty) ...[
                const Divider(),
                ...section2,
              ],
            ],
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
                children: section1,
              ),
              if (section2.isNotEmpty)
                CupertinoListSection.insetGrouped(
                  children: section2,
                ),
            ],
          ),
        ),
    };
  }
}
