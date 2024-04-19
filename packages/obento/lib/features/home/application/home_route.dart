import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:obento/features/home/presentation/home_page.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/home';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = HomePage();

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => MaterialPage(
          child: child,
          name: state.matchedLocation,
        ),
      InheritedThemeType.cupertino => CupertinoPage(
          child: child,
          name: state.matchedLocation,
        )
    };
  }
}
