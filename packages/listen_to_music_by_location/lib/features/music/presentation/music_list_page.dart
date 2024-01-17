import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_tile.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicListPage extends HookConsumerWidget {
  const MusicListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      // appBar: AppBar(
      //   title: const Text('hoge'),
      //   backgroundColor: Colors.transparent,
      //   // foregroundColor: Colors.transparent,
      //   surfaceTintColor: Colors.transparent,
      //   // elevation: 0,
      // ),
      navigationBar: const CupertinoNavigationBar(),
      child: ref.watch(locamusicWithSongDetailsProvider).maybeWhen(
            orElse: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            data: (data) => ListView(
              children: [
                CupertinoListSection.insetGrouped(
                  children: data
                      .map<Widget>(
                        (e) => MusicListTile(
                          title: e.songDetails?.title ?? i18n.unset,
                          artworkUrl: e.songDetails?.artworkUrl,
                          onTap: () {},
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
    );
  }
}
