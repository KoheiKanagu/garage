import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class MusicListTile extends HookConsumerWidget {
  const MusicListTile(
    this.musicId, {
    required this.onTap,
    super.key,
  });

  final String? musicId;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const padding = EdgeInsetsDirectional.only(
      start: 20,
      end: 14,
      top: 8,
      bottom: 8,
    );

    return musicId == null
        // 曲が設定されていない場合はデフォルト表示
        ? CupertinoListTile(
            title: Text(i18n.tap_to_set),
            trailing: const CupertinoListTileChevron(),
            leadingSize: MusicArtworkWidget.kDefaultSize,
            leading: const MusicArtworkWidget(
              artworkUrl: null,
            ),
            onTap: onTap,
            padding: padding,
          )
        : ref.watch(locamusicSongDetailsProvider(musicId!)).maybeWhen(
              orElse: () => const CupertinoListTile(
                title: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                leadingSize: MusicArtworkWidget.kDefaultSize,
                leading: MusicArtworkWidget(
                  artworkUrl: null,
                ),
                padding: padding,
              ),
              data: (data) => CupertinoListTile(
                title: Text(
                  data.title,
                  maxLines: 3,
                ),
                trailing: const CupertinoListTileChevron(),
                leadingSize: MusicArtworkWidget.kDefaultSize,
                leading: MusicArtworkWidget(
                  artworkUrl: data.artworkUrl,
                ),
                onTap: onTap,
                padding: padding,
              ),
            );
  }
}
