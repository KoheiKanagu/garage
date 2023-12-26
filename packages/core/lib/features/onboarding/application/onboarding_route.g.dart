// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'onboarding_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $onboardingPageRoute,
    ];

RouteBase get $onboardingPageRoute => GoRouteData.$route(
      path: '/',
      factory: $OnboardingPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'sign_in',
          factory: $SignInPageRouteExtension._fromState,
        ),
      ],
    );

extension $OnboardingPageRouteExtension on OnboardingPageRoute {
  static OnboardingPageRoute _fromState(GoRouterState state) =>
      OnboardingPageRoute(
        $extra: state.extra as List<Widget>,
      );

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $SignInPageRouteExtension on SignInPageRoute {
  static SignInPageRoute _fromState(GoRouterState state) =>
      const SignInPageRoute();

  String get location => GoRouteData.$location(
        '/sign_in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
