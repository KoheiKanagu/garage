import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_route.dart'
    as hashtag_route;
import 'package:obento/features/onboarding/application/onboarding_route.dart'
    as onboarding_route;
import 'package:obento/features/preview/application/preview_route.dart'
    as preview_route;
import 'package:obento/gen/strings.g.dart';

final _routes = [
  ...onboarding_route.$appRoutes,
  ...hashtag_route.$appRoutes,
  ...preview_route.$appRoutes,
];

final myThemeBuilder = MyThemeBuilder(
  baseColor: const Color(0xFFFF5722),
  baseDarkColor: const Color(0xFFFF9800),
);

class MyApp extends HookConsumerWidget {
  const MyApp({
    required this.targetPlatform,
    required this.navigatorKey,
    super.key,
  });

  final TargetPlatform targetPlatform;

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(
      myGoRouterProvider(
        navigatorKey: navigatorKey,
        routes: _routes,
        signedInLocation: const hashtag_route.HashtagPageRoute().location,
      ),
    );

    return MyBetterFeedback(
      child: targetPlatform == TargetPlatform.iOS
          ? CupertinoApp.router(
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: localizationsDelegates,
              theme: myThemeBuilder.cupertinoThemeData,
              routerConfig: router,
            )
          : MaterialApp.router(
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: localizationsDelegates,
              theme: myThemeBuilder.materialLightThemeData,
              darkTheme: myThemeBuilder.materialDarkThemeData,
              routerConfig: router,
            ),
    );
  }
}
