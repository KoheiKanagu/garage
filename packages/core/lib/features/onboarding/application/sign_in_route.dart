import 'package:core/features/onboarding/presentation/sign_in_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'sign_in_route.g.dart';

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
