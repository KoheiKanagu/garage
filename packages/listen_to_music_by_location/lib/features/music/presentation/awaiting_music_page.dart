import 'package:core/common_widgets/my_smooth_page_indicator.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/apple_music_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/awaiting_music_how_to_share_page_view.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AwaitingMusicPage extends HookConsumerWidget {
  const AwaitingMusicPage({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();

    ref.listen(
      appLinksMusicIdProvider,
      (_, next) async {
        final id = next.asData?.value;
        if (id == null) {
          return;
        }

        final indicator = showMyProgressIndicator();

        final doc = await ref.read(
          locamusicDocumentProvider(documentId).future,
        );
        await ref.read(
          locamusicUpdateProvider(
            documentId,
            locamusic: doc.copyWith(
              musicId: id,
            ),
          ).future,
        );

        indicator.dismiss();

        if (context.mounted) {
          GoRouter.of(context).pop();
        }
      },
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(i18n.locamusic.awaiting_music_share),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Gap(12),
            Expanded(
              child: AwaitingMusicHowToSharePageView(controller),
            ),
            const Gap(12),
            MySmoothPageIndicator(controller),
            const Gap(24),
            CupertinoButton.filled(
              child: Text(i18n.locamusic.open_apple_music),
              onPressed: () {
                launchUrlString(
                  'https://music.apple.com/listen-now',
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
