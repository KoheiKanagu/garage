import 'package:core/features/configure/domain/configure_item.dart';
import 'package:core/features/configure/presentation/about_this_app_page.dart';
import 'package:core/features/configure/presentation/configure_page.dart';
import 'package:core/features/configure/presentation/failed_run_app_page.dart';
import 'package:core/features/configure/presentation/my_license_page.dart';
import 'package:core/features/configure/presentation/service_down_page.dart';
import 'package:core/features/configure/presentation/update_app_page.dart';
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

@TypedGoRoute<UpdateAppPageRoute>(
  path: UpdateAppPageRoute.path,
)
class UpdateAppPageRoute extends GoRouteData {
  const UpdateAppPageRoute({
    required this.force,
  });

  static const path = '/update_app&force=:force';

  final bool force;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final child = UpdateAppPage(
      force: force,
    );

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => MaterialPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        ),
      InheritedThemeType.cupertino => CupertinoPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        )
    };
  }
}

@TypedGoRoute<ServiceDownPageRoute>(
  path: ServiceDownPageRoute.path,
)
class ServiceDownPageRoute extends GoRouteData {
  const ServiceDownPageRoute();

  static const path = '/service_down';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = ServiceDownPage();

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => MaterialPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        ),
      InheritedThemeType.cupertino => CupertinoPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        )
    };
  }
}

@TypedGoRoute<FailedRunAppPageRoute>(
  path: FailedRunAppPageRoute.path,
)
class FailedRunAppPageRoute extends GoRouteData {
  const FailedRunAppPageRoute();

  static const path = '/failed_run_app';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = FailedRunAppPage();

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => MaterialPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        ),
      InheritedThemeType.cupertino => CupertinoPage(
          child: child,
          name: state.matchedLocation,
          fullscreenDialog: true,
        )
    };
  }
}
