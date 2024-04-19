import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/home/application/home_route.dart' as home_route;
import 'package:obento/features/onboarding/application/onboarding_route.dart'
    as onboarding_route;
import 'package:obento/gen/strings.g.dart';

final _routes = [
  ...onboarding_route.$appRoutes,
  ...home_route.$appRoutes,
];

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  static const theme = CupertinoThemeData(
    primaryColor: CupertinoDynamicColor.withBrightness(
      color: Color(0xFFFF5722),
      darkColor: Color(0xFFFF9800),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(
      myGoRouterProvider(
        routes: _routes,
        signedInLocation: const home_route.HomePageRoute().location,
      ),
    );

    return MyBetterFeedback(
      cupertinoThemeData: theme,
      child: CupertinoApp.router(
        debugShowCheckedModeBanner: false,
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
        localizationsDelegates: localizationsDelegates,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
