import 'package:core/core.dart';
import 'package:core/features/configure/presentation/configure_list_tile.dart';
import 'package:core/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigurePage extends HookConsumerWidget {
  const ConfigurePage({
    required this.additionalItems,
    super.key,
  });

  final List<ConfigureItem> additionalItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.configure.title),
      ),
      body: ListView(
        children: [
          ConfigureListTile(
            title: i18n.configure.feedback,
            onTap: () async {
              final url = await ref.watch(configureFeedbackUriProvider.future);

              if (url != null) {
                await launchUrl(url);
              }
            },
          ),
          ConfigureListTile(
            title: i18n.configure.about_this_app,
            onTap: () {
              const AboutThisAppPageRoute().push<void>(context);
            },
          ),
        ],
      ),
    );
  }
}
