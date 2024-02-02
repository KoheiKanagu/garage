import 'package:core/core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(
      myGoRouterProvider(
        routes: _routes,
        signedInLocation: const home_route.HomePageRoute().location,
      ),
    );

    const theme = CupertinoThemeData(
      primaryColor: CupertinoDynamicColor.withBrightness(
        color: Color(0xFFFA233B),
        darkColor: Color(0xFFFB5C74),
      ),
    );

    return MyBetterFeedback(
      cupertinoThemeData: theme,
      child: CupertinoApp.router(
        builder: (context, child) => MediaQueryPreview(
          context,
          child,
          cupertino: true,
        )
            // .disableDynamicIsland()
            // .textScale05()
            .textScale10()
            // .textScale15()
            // .textScale20()
            // .android()
            .build(),
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FirebaseUILocalizations.delegate,
        ],
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
