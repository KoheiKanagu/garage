import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/apple_music_providers.dart';

class GeofenceSelectPage extends HookConsumerWidget {
  const GeofenceSelectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songDetails = ref.watch(appleMusicAppLinkSongDetailsProvider);

    return Scaffold(
      appBar: AppBar(),
      body: songDetails.maybeWhen(
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
