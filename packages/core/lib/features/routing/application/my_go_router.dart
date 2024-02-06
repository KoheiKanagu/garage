import 'dart:core';

import 'package:core/core.dart';
import 'package:core/features/configure/application/configure_route.dart'
    as configure_route;
import 'package:core/features/onboarding/application/sign_in_route.dart'
    as sign_in_route;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_go_router.g.dart';

bool disableRouterRedirect = false;

bool skipUpdateApp = false;

const initialLocation = '/';

@riverpod
Raw<GoRouter> myGoRouter(
  MyGoRouterRef ref, {
  required List<RouteBase> routes,
  required String signedInLocation,
}) {
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

  return GoRouter(
    navigatorKey: rootNavigatorStateKey,
    routes: [
      ...routes,
      ...sign_in_route.$appRoutes,
      ...configure_route.$appRoutes,
    ],
    errorBuilder: (context, state) {
      logger.severe({
        'error': state.error,
        'name': state.name,
        'fullPath': state.fullPath,
        'pathParameters': state.pathParameters,
        'queryParameters': state.uri.queryParameters,
        'location': state.uri,
        'queryParametersAll': state.uri.queryParametersAll,
      });

      return const FailedRunAppPage();
    },
    refreshListenable: listenable,
    redirect: (context, state) async {
      // デバッグビルドで特定の条件下でリダイレクトを無効に
      if (disableRouterRedirect && kDebugMode) {
        return null;
      }

      final (signedIn, requiredUpdate, releasedNewVersion, serviceStatus) = (
        await ref.read(firebaseUserIsSignedInProvider.future),
        await ref.read(configureIsRequiredUpdateProvider.future),
        await ref.read(configureIsReleasedNewVersionProvider.future),
        await ref.read(configureServiceStatusProvider.future),
      );

      // サービスがダウンしている場合はサービスダウン画面に遷移
      if (serviceStatus == ServiceStatus.down) {
        return const configure_route.ServiceDownPageRoute().location;
      }

      // 必須のアップデートがある場合はアップデート画面に遷移
      if (requiredUpdate) {
        return const configure_route.UpdateAppPageRoute(force: true).location;
      }

      // 新しいバージョンがリリースされている場合は、アップデート画面に遷移
      // 一旦スキップしていたら再表示しない
      if (releasedNewVersion && !skipUpdateApp) {
        return const configure_route.UpdateAppPageRoute(force: false).location;
      }

      // 未サインインで到達できるroute
      final unauthorizedRoute = [
        initialLocation,
        const sign_in_route.SignInPageRoute().location,
      ];

      if (signedIn) {
        // サインイン済みなのに、未サインインRouteの場合はホーム画面に遷移
        if (unauthorizedRoute.any((element) => element == state.fullPath)) {
          return signedInLocation;
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
