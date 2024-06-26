import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/home/application/home_route.dart'
    as home_route;
import 'package:listen_to_music_by_location/features/music/application/music_route.dart'
    as music_route;
import 'package:listen_to_music_by_location/features/onboarding/application/onboarding_route.dart'
    as onboarding_route;
import 'package:listen_to_music_by_location/features/permission/application/permission_route.dart'
    as permission_route;
import 'package:listen_to_music_by_location/gen/strings.g.dart';

final _routes = [
  ...onboarding_route.$appRoutes,
  ...home_route.$appRoutes,
  ...music_route.$appRoutes,
  ...permission_route.$appRoutes,
];

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  static const color = Color(0xFFFA233B);
  static const darkColor = Color(0xFFFB5C74);

  static const theme = CupertinoThemeData(
    primaryColor: CupertinoDynamicColor.withBrightness(
      color: color,
      darkColor: darkColor,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(
      myGoRouterProvider(
        navigatorKey: GlobalObjectKey(context),
        routes: _routes,
        signedInLocation: const home_route.HomePageRoute().location,
      ),
    );

    return MyBetterFeedback(
      child: CupertinoApp.router(
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: localizationsDelegates,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
