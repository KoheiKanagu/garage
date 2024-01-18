import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page_header.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class LocamusicDetailPage extends HookConsumerWidget {
  const LocamusicDetailPage({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      locamusicWithSongDetailsProvider(
        documentId: documentId,
      ),
    );

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: i18n.app_name,
        middle: Text(i18n.locamusic.title),
      ),
      child: data.maybeWhen(
        orElse: CircularProgressIndicator.adaptive,
        data: (data) => ListView(
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      LocamusicDetailPageHeader(
                        documentId: documentId,
                        songDetails: data.songDetails,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
