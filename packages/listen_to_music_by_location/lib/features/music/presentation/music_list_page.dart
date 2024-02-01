import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/configure/application/my_configure_route.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/music_route.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_tile.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicListPage extends HookConsumerWidget {
  const MusicListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locamusics =
        ref.watch(locamusicDocumentsProvider).asData?.value ?? [];

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            largeTitle: Text(i18n.app_name),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(
                CupertinoIcons.settings,
              ),
              onPressed: () {
                MyConfigureRoute(context).push<void>(context);
              },
            ),
          ),
          if (locamusics.isNotEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: CupertinoListSection(
                additionalDividerMargin: MusicArtworkWidget.kDefaultSize + 16,
                children: locamusics.map<Widget>(
                  (e) {
                    void onTap() {
                      LocamusicDetailPageRoute(e.documentId)
                          .push<void>(context);
                    }

                    final musicId = e.locamusic.musicId;
                    // 曲が設定されていない場合はデフォルト表示
                    if (musicId == null) {
                      return MusicListTile(
                        title: i18n.tap_to_set,
                        artworkUrl: null,
                        onTap: onTap,
                      );
                    }

                    final details = ref
                        .watch(
                          locamusicSongDetailsProvider(musicId),
                        )
                        .asData
                        ?.value;

                    return MusicListTile(
                      title: details?.title,
                      artworkUrl: details?.artworkUrl,
                      onTap: onTap,
                    );
                  },
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
