import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/onboarding/presentation/onboarding_page.dart';

part 'onboarding_route.g.dart';

@TypedGoRoute<OnboardingPageRoute>(
  path: OnboardingPageRoute.path,
)
class OnboardingPageRoute extends GoRouteData {
  const OnboardingPageRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingPage();
  }
}
