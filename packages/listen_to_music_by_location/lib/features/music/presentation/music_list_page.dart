import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/music_route.dart';
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
      child: ref.watch(locamusicWithSongDetailsProvider).maybeWhen(
            orElse: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            data: (data) => CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: Text(i18n.locamusic.name),
                  trailing: CupertinoButton(
                    child: const Icon(
                      CupertinoIcons.settings,
                    ),
                    onPressed: () {
                      const ConfigurePageRoute().push<void>(context);
                    },
                  ),
                ),
                SliverFillRemaining(
                  child: CupertinoListSection.insetGrouped(
                    children: data
                        .map<Widget>(
                          (e) => MusicListTile(
                            title: e.songDetails?.title ?? i18n.unset,
                            artworkUrl: e.songDetails?.artworkUrl,
                            onTap: () {
                              LocamusicDetailPageRoute(e.documentId)
                                  .push<void>(context);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
