import 'package:core/features/configure/domain/configure_item.dart';
import 'package:core/features/configure/presentation/about_this_app_page.dart';
import 'package:core/features/configure/presentation/configure_page.dart';
import 'package:core/features/configure/presentation/my_license_page.dart';
import 'package:core/features/configure/presentation/user_info_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'configure_route.g.dart';

@TypedGoRoute<ConfigurePageRoute>(
  path: ConfigurePageRoute.path,
)
class ConfigurePageRoute extends GoRouteData {
  const ConfigurePageRoute({
    this.$extra = const [],
  });

  static const path = '/configure';

  final List<ConfigureItem> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ConfigurePage(
      additionalItems: $extra,
    );
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
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutThisAppPage();
  }
}

class MyLicensePageRoute extends GoRouteData {
  const MyLicensePageRoute();

  static const path = 'license';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyLicensePage();
  }
}

@TypedGoRoute<UserInfoPageRoute>(
  path: UserInfoPageRoute.path,
)
class UserInfoPageRoute extends GoRouteData {
  const UserInfoPageRoute();

  static const path = '/user_info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserInfoPage();
  }
}
