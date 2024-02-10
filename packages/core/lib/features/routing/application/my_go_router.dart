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
  // リダイレクトに必要な値を監視するためのListenable
  final listenable = ValueNotifier<int>(0);
  ref
    ..listen(
      firebaseUserIsSignedInProvider.selectAsync((data) => data.hashCode),
      (_, next) async {
        listenable.value = await next;
      },
    )
    ..listen(
      configureIsRequiredUpdateProvider.selectAsync((data) => data.hashCode),
      (_, next) async {
        listenable.value = await next;
      },
    )
    ..listen(
      configureIsReleasedNewVersionProvider
          .selectAsync((data) => data.hashCode),
      (_, next) async {
        listenable.value = await next;
      },
    )
    ..listen(
      configureServiceStatusProvider.selectAsync((data) => data.hashCode),
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

      // 末端のページではリダイレクトしない
      final notRedirectLocations = [
        const configure_route.FailedRunAppPageRoute().location,
        const configure_route.UpdateAppPageRoute(force: true).location,
        const configure_route.UpdateAppPageRoute(force: false).location,
      ];
      if (notRedirectLocations.any((element) => element == state.fullPath)) {
        return null;
      }

      // リダイレクトに必要な値を取得
      // それぞれlistenしているため、初回以外では待つ必要はないはず...
      final results = await Future.wait(
        [
          ref.read(firebaseUserIsSignedInProvider.future),
          ref.read(configureIsRequiredUpdateProvider.future),
          ref.read(configureIsReleasedNewVersionProvider.future),
          ref.read(configureServiceStatusProvider.future),
        ],
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => [],
      );
      if (results.isEmpty) {
        logger.severe('Failed to redirect');
        return const configure_route.FailedRunAppPageRoute().location;
      }

      final signedIn = results[0] as bool;
      final requiredUpdate = results[1] as bool;
      final releasedNewVersion = results[2] as bool;
      final serviceStatus = results[3] as ServiceStatus;

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
