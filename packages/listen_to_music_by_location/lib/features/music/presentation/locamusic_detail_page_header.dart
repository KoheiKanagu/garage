import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/application/music_route.dart';
import 'package:listen_to_music_by_location/features/music/presentation/apple_music_badge.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_artwork_widget.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocamusicDetailPageHeader extends HookConsumerWidget {
  const LocamusicDetailPageHeader({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicId = ref.watch(
      locamusicDocumentProvider(documentId).select(
        (value) => value.whenData((value) => value.musicId),
      ),
    );
    if (musicId.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    final value = musicId.asData?.value;
    if (value == null) {
      // 曲が設定されていない場合は設定できるボタンを表示
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

    final songDetails = ref.watch(locamusicSongDetailsProvider(value));
    return songDetails.maybeWhen(
      orElse: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      data: (data) => Column(
        children: [
          SizedBox.square(
            dimension: 256,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: MusicArtworkWidget(
                artworkUrl: data.artworkUrl,
              ),
            ),
          ),
          const Gap(20),
          Column(
            children: [
              Text(
                data.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              const Gap(8),
              Text(
                data.artistName,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppleMusicBadge(
                onTap: () {
                  if (data.songUrl != null) {
                    launchUrlString(
                      data.songUrl!,
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
              ),
              CupertinoButton(
                child: Text(i18n.locamusic.change_music),
                onPressed: () {
                  AwaitingMusicPageRoute(documentId).push<void>(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
