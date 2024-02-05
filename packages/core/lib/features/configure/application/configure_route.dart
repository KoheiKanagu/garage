import 'package:core/features/configure/domain/configure_item.dart';
import 'package:core/features/configure/presentation/about_this_app_page.dart';
import 'package:core/features/configure/presentation/configure_page.dart';
import 'package:core/features/configure/presentation/my_license_page.dart';
import 'package:core/features/configure/presentation/user_info_page.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'configure_route.g.dart';

@TypedGoRoute<ConfigurePageRoute>(
  path: ConfigurePageRoute.path,
)
class ConfigurePageRoute extends GoRouteData {
  const ConfigurePageRoute({
    this.$extra,
  });

  static const path = '/configure';

  final List<ConfigureItem>? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final child = ConfigurePage(
      additionalItems: $extra ?? [],
    );

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

@TypedGoRoute<AboutThisAppPageRoute>(
  path: AboutThisAppPageRoute.path,
  routes: [
    TypedGoRoute<MyLicensePageRoute>(
      path: MyLicensePageRoute.path,
    ),
  ],
)
class AboutThisAppPageRoute extends GoRouteData {
  const AboutThisAppPageRoute();

  static const path = '/about_this_app';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = AboutThisAppPage();

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

class MyLicensePageRoute extends GoRouteData {
  const MyLicensePageRoute();

  static const path = 'license';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = MyLicensePage();

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

@TypedGoRoute<UserInfoPageRoute>(
  path: UserInfoPageRoute.path,
)
class UserInfoPageRoute extends GoRouteData {
  const UserInfoPageRoute();

  static const path = '/user_info';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = UserInfoPage();

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
