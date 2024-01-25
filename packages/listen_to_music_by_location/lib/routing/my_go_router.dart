import 'package:core/core.dart';
import 'package:core/features/configure/application/configure_route.dart'
    as configure_route;
import 'package:core/features/onboarding/application/sign_in_route.dart'
    as sign_in_route;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/home/application/home_route.dart'
    as home_route;
import 'package:listen_to_music_by_location/features/music/application/music_route.dart'
    as music_route;
import 'package:listen_to_music_by_location/features/onboarding/application/onboarding_route.dart'
    as onboarding_route;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router.g.dart';

@riverpod
Raw<GoRouter> myGoRouter(MyGoRouterRef ref) {
  final listenable = ValueNotifier<bool?>(null);

  ref
    ..listen(
      firebaseUserIsSignedInProvider.future,
      (_, next) async {
        listenable.value = await next;
      },
    )
    ..onDispose(
      listenable.dispose,
    );

  final initialLocation = const onboarding_route.OnboardingPageRoute().location;

  return GoRouter(
    navigatorKey: rootNavigatorStateKey,
    routes: [
      ...onboarding_route.$appRoutes,
      ...home_route.$appRoutes,
      ...music_route.$appRoutes,

      // from core
      ...sign_in_route.$appRoutes,
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
    refreshListenable: listenable,
    redirect: (context, state) async {
      // 未サインインで到達できるroute
      final unauthorizedRoute = [
        initialLocation,
        const sign_in_route.SignInPageRoute().location,
      ];

      final signedIn = await ref.read(firebaseUserIsSignedInProvider.future);
      if (signedIn) {
        // サインイン済みなのに、未サインインRouteの場合はホーム画面に遷移
        if (unauthorizedRoute.any((element) => element == state.fullPath)) {
          return const home_route.HomePageRoute().location;
        }

        // サインイン済みの場合は何もしない
        return null;
      }

      // 未サインイン状態でも遷移できるページの場合は何もしない
      if (unauthorizedRoute.any((element) => element == state.fullPath)) {
        return null;
      }

      return initialLocation;
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
    initialLocation: initialLocation,
  );
}
