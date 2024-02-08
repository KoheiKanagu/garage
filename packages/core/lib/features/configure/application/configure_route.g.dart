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
      $updateAppPageRoute,
      $serviceDownPageRoute,
      $failedRunAppPageRoute,
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

RouteBase get $updateAppPageRoute => GoRouteData.$route(
      path: '/update_app&force=:force',
      factory: $UpdateAppPageRouteExtension._fromState,
    );

extension $UpdateAppPageRouteExtension on UpdateAppPageRoute {
  static UpdateAppPageRoute _fromState(GoRouterState state) =>
      UpdateAppPageRoute(
        force: _$boolConverter(state.pathParameters['force']!),
      );

  String get location => GoRouteData.$location(
        '/update_app&force=${Uri.encodeComponent(force.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $serviceDownPageRoute => GoRouteData.$route(
      path: '/service_down',
      factory: $ServiceDownPageRouteExtension._fromState,
    );

extension $ServiceDownPageRouteExtension on ServiceDownPageRoute {
  static ServiceDownPageRoute _fromState(GoRouterState state) =>
      const ServiceDownPageRoute();

  String get location => GoRouteData.$location(
        '/service_down',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $failedRunAppPageRoute => GoRouteData.$route(
      path: '/failed_run_app',
      factory: $FailedRunAppPageRouteExtension._fromState,
    );

extension $FailedRunAppPageRouteExtension on FailedRunAppPageRoute {
  static FailedRunAppPageRoute _fromState(GoRouterState state) =>
      const FailedRunAppPageRoute();

  String get location => GoRouteData.$location(
        '/failed_run_app',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
