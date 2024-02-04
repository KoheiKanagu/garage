import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:listen_to_music_by_location/features/home/presentation/home_page_banner.dart';
import 'package:listen_to_music_by_location/features/map/presentation/map_page.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_page.dart';
import 'package:listen_to_music_by_location/features/permission/application/permission_providers.dart';
import 'package:listen_to_music_by_location/features/permission/application/permission_route.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen(
        locamusicHandlerProvider,
        (_, __) {},
      )
      ..listen(
        locamusicRegionHandlerProvider,
        (_, __) {},
      );

    final permissionError =
        ref.watch(permissionRequestIsNeedProvider).asData?.value ?? false;

    final isEmptyLocamusics = ref.watch(
      locamusicDocumentsProvider.select(
        (value) => value.maybeWhen(
          orElse: () => true,
          data: (data) => data.isEmpty,
        ),
      ),
    );

    return Scaffold(
      floatingActionButton: Padding(
        // TabBarと被らないようにpaddingを設定
        padding: const EdgeInsets.only(
          bottom: 76,
          left: 12,
          right: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Visibility(
              visible: isEmptyLocamusics,
              child: HomePageBanner(
                label: i18n.try_long_press,
                leading: const Icon(
                  CupertinoIcons.lightbulb_fill,
                  color: CupertinoColors.white,
                ),
                onPressed: () {},
              ),
            ),
            Visibility(
              visible: permissionError,
              child: HomePageBanner(
                leading: const Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  color: CupertinoColors.systemYellow,
                ),
                label: i18n.permission.error_banner_label,
                onPressed: () {
                  const PermissionPageRoute().push<void>(context);
                },
              ),
            ),
          ].intersperse(const Gap(8)).toList(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.map_pin_ellipse),
              label: i18n.map,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.music_albums_fill),
              label: i18n.app_name,
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
      ),
    );
  }
}
