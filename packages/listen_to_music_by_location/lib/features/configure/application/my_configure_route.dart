import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:listen_to_music_by_location/features/permission/application/permission_route.dart';

class MyConfigureRoute extends ConfigurePageRoute {
  MyConfigureRoute(BuildContext context)
      : super(
          $extra: [
            ConfigureItem(
              text: 'go ${PermissionPageRoute.path}',
              onTap: () {
                const PermissionPageRoute().push<void>(context);
              },
              forDebug: true,
            ),
          ],
        );
}
