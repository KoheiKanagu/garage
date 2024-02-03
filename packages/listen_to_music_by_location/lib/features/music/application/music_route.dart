import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/music/presentation/awaiting_music_page.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page.dart';

part 'music_route.g.dart';

@TypedGoRoute<LocamusicDetailPageRoute>(
  path: LocamusicDetailPageRoute.path,
  routes: [
    TypedGoRoute<AwaitingMusicPageRoute>(
      path: AwaitingMusicPageRoute.path,
    ),
  ],
)
class LocamusicDetailPageRoute extends GoRouteData {
  const LocamusicDetailPageRoute(
    this.documentId,
  );

  static const path = '/locamusic/:documentId';

  final String documentId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: LocamusicDetailPage(
        documentId: documentId,
      ),
      name: state.matchedLocation,
    );
  }
}

class AwaitingMusicPageRoute extends GoRouteData {
  const AwaitingMusicPageRoute(
    this.documentId,
  );

  static const path = 'awaiting';

  final String documentId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: AwaitingMusicPage(
        documentId: documentId,
      ),
      fullscreenDialog: true,
      name: state.matchedLocation,
    );
  }
}
