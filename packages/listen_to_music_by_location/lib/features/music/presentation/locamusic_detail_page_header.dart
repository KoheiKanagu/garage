import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/music_route.dart';
import 'package:listen_to_music_by_location/features/music/presentation/apple_music_badge.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class LocamusicDetailPageHeader extends HookConsumerWidget {
  const LocamusicDetailPageHeader({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicId = ref
        .watch(
          locamusicDocumentProvider(
            documentId: documentId,
          ),
        )
        .asData
        ?.value
        .musicId;

    final songDetails = musicId == null
        ? null
        : ref
            .watch(
              locamusicSongDetailsProvider(musicId: musicId),
            )
            .value;

    if (songDetails == null) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          child: Text(i18n.locamusic.select_music),
          onPressed: () {
            AwaitingMusicPageRoute(documentId).push<void>(context);
          },
        ),
      );
    }

    return Column(
      children: [
        Row(
          children: [
            MusicArtworkWidget(
              artworkUrl: songDetails.artworkUrl,
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songDetails.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    songDetails.artistName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppleMusicBadge(),
            CupertinoButton(
              child: Text(
                i18n.locamusic.change_music,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onPressed: () {
                AwaitingMusicPageRoute(documentId).push<void>(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}