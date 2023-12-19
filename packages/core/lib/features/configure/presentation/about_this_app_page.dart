import 'package:core/core.dart';
import 'package:core/features/configure/presentation/configure_list_tile.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.configure.about_this_app),
      ),
      body: ListView(
        children: [
          ConfigureListTile(
            title: i18n.configure.terms_of_service,
            onTap: () async {
              final url =
                  await ref.read(configureTermsOfServiceUriProvider.future);

              if (url != null) {
                await launchUrl(url);
              }
            },
          ),
          ConfigureListTile(
            title: i18n.configure.privacy_policy,
            onTap: () async {
              final url =
                  await ref.read(configurePrivacyPolicyUriProvider.future);

              if (url != null) {
                await launchUrl(url);
              }
            },
          ),
          ConfigureListTile(
            title: i18n.configure.license,
            onTap: () {
              const MyLicensePageRoute().push<void>(context);
            },
          ),
        ],
      ),
    );
  }
}
