import 'package:core/features/onboarding/presentation/onboarding_page.dart';
import 'package:core/features/onboarding/presentation/sign_in_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'onboarding_route.g.dart';

@TypedGoRoute<OnboardingPageRoute>(
  path: OnboardingPageRoute.path,
  routes: [
    TypedGoRoute<SignInPageRoute>(
      path: SignInPageRoute.path,
    ),
  ],
)
class OnboardingPageRoute extends GoRouteData {
  const OnboardingPageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingPage();
  }
}

class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  static const path = 'sign_in';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}
