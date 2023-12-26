import 'package:core/core.dart';
import 'package:core/features/configure/application/configure_route.dart'
    as configure_route;
import 'package:core/features/onboarding/application/onboarding_route.dart'
    as onboarding_route;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/home/application/home_route.dart'
    as home_route;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router.g.dart';

@riverpod
Raw<GoRouter> myGoRouter(MyGoRouterRef ref) {
  final signIn =
      ref.watch(firebaseUserIsSignedInProvider).asData?.value ?? false;

  return GoRouter(
    navigatorKey: rootNavigatorStateKey,
    routes: [
      ...onboarding_route.$appRoutes,
      ...home_route.$appRoutes,
      ...configure_route.$appRoutes,
    ],
    errorBuilder: (context, state) {
      logger.e(
        [
          'router error',
          'name: ${state.name}',
          'fullPath: ${state.fullPath}',
          'pathParameters: ${state.pathParameters}',
          'queryParameters: ${state.uri.queryParameters}',
          'location: ${state.uri}',
          'queryParametersAll: ${state.uri.queryParametersAll}',
        ],
        error: state.error,
        stackTrace: StackTrace.current,
      );

      return const FailedRunApp();
    },
    observers: [
      MyNavigatorObserver(
        ref.watch(firebaseCrashlyticsProvider),
      ),
      FirebaseAnalyticsObserver(
        analytics: ref.watch(firebaseAnalyticsProvider),
      ),
    ],
    debugLogDiagnostics: kDebugMode,
    initialLocation: signIn
        ? const home_route.HomePageRoute().location
        : const onboarding_route.OnboardingPageRoute().location,
  );
}
