// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'geofence_select_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $geofenceSelectPageRoute,
    ];

RouteBase get $geofenceSelectPageRoute => GoRouteData.$route(
      path: '/geofence_select',
      factory: $GeofenceSelectPageRouteExtension._fromState,
    );

extension $GeofenceSelectPageRouteExtension on GeofenceSelectPageRoute {
  static GeofenceSelectPageRoute _fromState(GoRouterState state) =>
      const GeofenceSelectPageRoute();

  String get location => GoRouteData.$location(
        '/geofence_select',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
