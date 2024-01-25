import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/permission/presentation/permission_page.dart';

part 'permission_route.g.dart';

@TypedGoRoute<PermissionPageRoute>(
  path: PermissionPageRoute.path,
)
class PermissionPageRoute extends GoRouteData {
  const PermissionPageRoute();

  static const path = '/permission';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(
      fullscreenDialog: true,
      child: PermissionPage(),
    );
  }
}
