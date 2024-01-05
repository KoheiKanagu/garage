import 'package:app_links/app_links.dart';
import 'package:listen_to_music_by_location/features/music/application/geomusic_providers.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apple_music_providers.g.dart';

@riverpod
Raw<Stream<Uri>> appLinksAllUriLink(
  AppLinksAllUriLinkRef ref,
) =>
    AppLinks().allUriLinkStream;

@riverpod
Stream<Uri> appleMusicAppLinks(
  AppleMusicAppLinksRef ref,
) =>
    ref
        .watch(appLinksAllUriLinkProvider)
        .where(
          (event) => event.host == 'shared',
        )
        .map(
          (event) => Uri.tryParse(
            event.pathSegments.first,
          ),
        )
        .where(
          (event) => event?.host == 'music.apple.com',
        )
        .cast<Uri>();

@riverpod
Future<SongDetails> appleMusicAppLinkSongDetails(
  AppleMusicAppLinkSongDetailsRef ref,
) async {
  final uri = await ref.watch(appleMusicAppLinksProvider.future);
  final id = uri.queryParameters['i'] ?? '';
  if (id.isEmpty) {
    throw ArgumentError('id is empty');
  }

  return ref.watch(myMusicHostApiProvider).songDetails(
        id: id,
      );
}
