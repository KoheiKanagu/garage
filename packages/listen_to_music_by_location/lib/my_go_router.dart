import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/home/application/home_route.dart'
    as home_route;

GoRouter myGoRouter({
  required FirebaseCrashlytics crashlytics,
  required FirebaseAnalytics analytics,
}) {
  return GoRouter(
    navigatorKey: rootNavigatorStateKey,
    routes: [
      ...home_route.$appRoutes,
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
      MyNavigatorObserver(crashlytics),
      FirebaseAnalyticsObserver(
        analytics: analytics,
      ),
    ],
    debugLogDiagnostics: kDebugMode,
  );
}
