import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:obento/features/preview/presentation/preview_page.dart';

part 'preview_route.g.dart';

@TypedGoRoute<PreviewPageRoute>(
  path: PreviewPageRoute.path,
)
class PreviewPageRoute extends GoRouteData {
  const PreviewPageRoute();

  static const path = '/preview';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = PreviewPage();

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
