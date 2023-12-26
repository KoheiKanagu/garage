import 'package:core/features/onboarding/presentation/onboarding_page.dart';
import 'package:core/features/onboarding/presentation/sign_in_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'onboarding_route.g.dart';

@TypedGoRoute<OnboardingPageRoute>(
  path: OnboardingPageRoute.path,
)
class OnboardingPageRoute extends GoRouteData {
  const OnboardingPageRoute({
    required this.$extra,
  });

  static const path = '/';

  final List<Widget> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OnboardingPage(
      children: $extra,
    );
  }
}

@TypedGoRoute<SignInPageRoute>(
  path: SignInPageRoute.path,
)
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  static const path = '/sign_in';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}
