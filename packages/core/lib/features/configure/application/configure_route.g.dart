// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'configure_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $configurePageRoute,
      $aboutThisAppPageRoute,
      $userInfoPageRoute,
    ];

RouteBase get $configurePageRoute => GoRouteData.$route(
      path: '/configure',
      factory: $ConfigurePageRouteExtension._fromState,
    );

extension $ConfigurePageRouteExtension on ConfigurePageRoute {
  static ConfigurePageRoute _fromState(GoRouterState state) =>
      ConfigurePageRoute(
        $extra: state.extra as List<ConfigureItem>?,
      );

  String get location => GoRouteData.$location(
        '/configure',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $aboutThisAppPageRoute => GoRouteData.$route(
      path: '/about_this_app',
      factory: $AboutThisAppPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'license',
          factory: $MyLicensePageRouteExtension._fromState,
        ),
      ],
    );

extension $AboutThisAppPageRouteExtension on AboutThisAppPageRoute {
  static AboutThisAppPageRoute _fromState(GoRouterState state) =>
      const AboutThisAppPageRoute();

  String get location => GoRouteData.$location(
        '/about_this_app',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MyLicensePageRouteExtension on MyLicensePageRoute {
  static MyLicensePageRoute _fromState(GoRouterState state) =>
      const MyLicensePageRoute();

  String get location => GoRouteData.$location(
        '/about_this_app/license',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userInfoPageRoute => GoRouteData.$route(
      path: '/user_info',
      factory: $UserInfoPageRouteExtension._fromState,
    );

extension $UserInfoPageRouteExtension on UserInfoPageRoute {
  static UserInfoPageRoute _fromState(GoRouterState state) =>
      const UserInfoPageRoute();

  String get location => GoRouteData.$location(
        '/user_info',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
