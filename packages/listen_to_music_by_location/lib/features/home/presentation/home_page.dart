import 'package:core/features/ads/application/ads_providers.dart';
import 'package:core/features/configure/application/shared_preferences_providers.dart';
import 'package:core/gen/strings.g.dart' as core_strings;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:listen_to_music_by_location/features/analytics/application/analytics_providers.dart';
import 'package:listen_to_music_by_location/features/home/presentation/home_page_banner.dart';
import 'package:listen_to_music_by_location/features/map/presentation/map_page.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_list_page.dart';
import 'package:listen_to_music_by_location/features/native/application/location_manager_delegate.dart';
import 'package:listen_to_music_by_location/features/native/application/native_provider.dart';
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
        locamusicHandlerProvider(
          didDetermineStateStream:
              ref.watch(locationManagerDidDetermineStateProvider),
          collectionReference: ref.watch(locamusicCollectionReferenceProvider),
          musicKit: ref.watch(musicKitProvider),
          analyticsController: ref.watch(analyticsControllerProvider),
        ),
        (_, __) {},
      )
      ..listen(
        locamusicRegionHandlerProvider,
        (_, __) {},
      );

    final isEmptyLocamusic = ref.watch(
      locamusicDocumentsProvider.select(
        (value) => value.asData?.value.isEmpty ?? false,
      ),
    );

    final isPermissionRequest = ref.watch(
      permissionRequestIsRequiredProvider.select(
        (value) => value.asData?.value ?? false,
      ),
    );

    final isRequestAdsConsentInfoUpdate = ref.watch(
      sharedPreferencesRequestAdsConsentInfoUpdateProvider,
    );

    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 64,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (isEmptyLocamusic)
              HomePageBanner(
                label: i18n.try_long_press,
                leading: const Icon(
                  CupertinoIcons.lightbulb_fill,
                  color: CupertinoColors.white,
                ),
                onPressed: () {},
              ),
            if (isPermissionRequest)
              HomePageBanner(
                leading: const Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  color: CupertinoColors.systemYellow,
                ),
                label: i18n.permission.error_banner_label,
                onPressed: () {
                  const PermissionPageRoute().push<void>(context);
                },
              ),
            if (isRequestAdsConsentInfoUpdate)
              HomePageBanner(
                leading: const Icon(
                  CupertinoIcons.exclamationmark_triangle_fill,
                  color: CupertinoColors.systemYellow,
                ),
                label: core_strings.i18n.ads.please_check_banner,
                onPressed: () async {
                  await ref
                      .read(sharedPreferencesControllerProvider.notifier)
                      .setRequestAdsConsentInfoUpdate();
                  await ref.read(adsRequestConsentInfoUpdateProvider.future);
                },
              ),
          ].intersperseOuter(const Gap(8)).toList(),
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
        tabBuilder: (context, index) => switch (index) {
          0 => const MapPage(),
          1 => const MusicListPage(),
          _ => throw UnimplementedError()
        },
      ),
    );
  }
}
