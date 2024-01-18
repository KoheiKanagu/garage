import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/apple_music_providers.dart';

class AwaitingMusicPage extends HookConsumerWidget {
  const AwaitingMusicPage({
    required this.documentId,
    super.key,
  });

  final String documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //     ref.listen(
    //   appleMusicAppLinksProvider,
    //   (_, next) {
    //     final uri = next.asData?.value;
    //     if (uri == null) {
    //       return;
    //     }

    //     const GeofenceSelectPageRoute().push<void>(context);
    //   },
    // );

    final songDetails = ref.watch(appleMusicAppLinkSongDetailsProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Locamusic',
        middle: Text('Select Music'),
      ),
      child: songDetails.maybeWhen(
        data: (data) {
          return Column(
            children: [
              Text(data.id),
              Text(data.title),
              Image.network(
                data.artworkUrl!,
              ),
            ],
          );
        },
        orElse: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
