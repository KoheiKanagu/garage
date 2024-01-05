import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/geofence_select/presentation/geofence_select_page.dart';

part 'geofence_select_route.g.dart';

@TypedGoRoute<GeofenceSelectPageRoute>(
  path: GeofenceSelectPageRoute.path,
)
class GeofenceSelectPageRoute extends GoRouteData {
  const GeofenceSelectPageRoute();

  static const path = '/geofence_select';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: GeofenceSelectPage(),
      fullscreenDialog: true,
    );
  }
}
