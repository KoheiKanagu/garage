import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page.dart';
import 'package:listen_to_music_by_location/features/music/presentation/music_awaiting_page.dart';

part 'music_route.g.dart';

@TypedGoRoute<LocamusicDetailPageRoute>(
  path: LocamusicDetailPageRoute.path,
  routes: [
    TypedGoRoute<MusicAwaitingPageRoute>(
      path: MusicAwaitingPageRoute.path,
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
    );
  }
}

class MusicAwaitingPageRoute extends GoRouteData {
  const MusicAwaitingPageRoute(
    this.documentId,
  );

  static const path = 'awaiting';

  final String documentId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: MusicAwaitingPage(
        documentId: documentId,
      ),
      fullscreenDialog: true,
    );
  }
}
