import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page.dart';

part 'hashtag_route.g.dart';

@TypedGoRoute<HashtagPageRoute>(
  path: HashtagPageRoute.path,
)
class HashtagPageRoute extends GoRouteData {
  const HashtagPageRoute();

  static const path = '/hashtags';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = HashtagsPage();

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
