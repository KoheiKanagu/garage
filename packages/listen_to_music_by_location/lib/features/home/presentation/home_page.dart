import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/map/presentation/map_page.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_page.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(KoheiKanagu): アイコンのpaddingが狭いので調整する
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.map_pin_ellipse),
            label: i18n.map,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.music_albums_fill),
            label: i18n.locamusic.name,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const MapPage();
          case 1:
            return const MusicListPage();
          default:
            throw UnimplementedError();
        }
      },
    );
  }
}
