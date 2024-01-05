import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/geofence_select/application/geofence_select_route.dart';
import 'package:listen_to_music_by_location/features/map/presentation/map_page.dart';
import 'package:listen_to_music_by_location/features/music/application/apple_music_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    ref.listen(
      appleMusicAppLinksProvider,
      (_, next) {
        final uri = next.asData?.value;
        if (uri == null) {
          return;
        }

        const GeofenceSelectPageRoute().push<void>(context);
      },
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          const ConfigurePageRoute().push<void>(context);
        },
        child: const Icon(
          Icons.settings,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: IndexedStack(
        index: currentIndex.value,
        children: const [
          MapPage(),
          MusicListPage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex.value,
        onTap: (value) => currentIndex.value = value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map_rounded,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
