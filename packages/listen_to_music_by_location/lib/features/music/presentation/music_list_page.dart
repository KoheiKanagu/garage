import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/application/geomusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MusicListPage extends HookConsumerWidget {
  const MusicListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = useState(DistanceRange.medium);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          CupertinoSlidingSegmentedControl(
            groupValue: current.value,
            backgroundColor: CupertinoColors.destructiveRed,
            children: const {
              DistanceRange.small: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Midnight',
                ),
              ),
              DistanceRange.medium: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Morning',
                ),
              ),
              DistanceRange.large: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Afternoon',
                ),
              ),
            },
            onValueChanged: (value) {
              current.value = value ?? DistanceRange.medium;
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final status =
                  await ref.read(myMusicHostApiProvider).requestPermission();
              print(status);
            },
            child: const Text('permission'),
          ),
          ElevatedButton(
            onPressed: () async {
              final status = await ref
                  .read(myMusicHostApiProvider)
                  .currentPermissionStatus();
              print(status);
            },
            child: const Text('status'),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await ref.read(myMusicHostApiProvider).songDetails(
                    id: '1713102666',
                  );
              print(result.id);
              print(result.title);
              print(result.artistName);
              print(result.artworkUrl);
              print(result.songUrl);

              await launchUrlString(
                result.songUrl ?? '',
              );
            },
            child: const Text('play'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(myLocationHostApiProvider)
                  .requestAuthorization(always: false);

              final result = await ref
                  .read(myFlutterApiDidChangeAuthorizationProvider.future);

              print('requestWhenInUseAuthorization: $result');
            },
            child: const Text('requestWhenInUseAuthorization'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(myLocationHostApiProvider)
                  .requestAuthorization(always: true);

              final result = await ref
                  .read(myFlutterApiDidChangeAuthorizationProvider.future);

              print('requestAlwaysAuthorization: $result');
            },
            child: const Text('requestAlwaysAuthorization'),
          ),
        ],
      ),
    );
  }
}
