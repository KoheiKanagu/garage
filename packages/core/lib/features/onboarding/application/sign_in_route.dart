import 'package:core/features/onboarding/presentation/sign_in_page.dart';
import 'package:core/utils/inherited_theme_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'sign_in_route.g.dart';

@TypedGoRoute<SignInPageRoute>(
  path: SignInPageRoute.path,
)
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  static const path = '/sign_in';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    const child = SignInPage();

    return switch (InheritedThemeDetector.of(context)) {
      InheritedThemeType.material => const MaterialPage(
          child: child,
        ),
      InheritedThemeType.cupertino => const CupertinoPage(
          child: child,
        )
    };
  }
}
