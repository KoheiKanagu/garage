import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
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
        previousPageTitle: i18n.locamusic.name,
        middle: Text(i18n.locamusic.details.title),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile.notched(
                title: const Text('音楽を設定する'),
                trailing: const Icon(CupertinoIcons.chevron_forward),
                onTap: () {
                  // const MusicSearchPageRoute().push<void>(context);
                },
              ),
              CupertinoListTile.notched(
                title: const Text('音楽を再生する'),
                trailing: const Icon(CupertinoIcons.chevron_forward),
                onTap: () {
                  // const MusicPlayPageRoute().push<void>(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
