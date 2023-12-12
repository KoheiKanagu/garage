// ignore_for_file: lines_longer_than_80_chars

import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

class MyNavigatorObserver extends NavigatorObserver {
  MyNavigatorObserver(
    this.firebaseCrashlytics,
  );

  final FirebaseCrashlytics firebaseCrashlytics;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCustomKey(
      route: route,
      previousRoute: previousRoute,
      didPush: false,
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setCustomKey(
      route: route,
      previousRoute: previousRoute,
      didPush: true,
    );
  }

  void _setCustomKey({
    required Route<dynamic> route,
    required Route<dynamic>? previousRoute,
    required bool didPush,
  }) {
    final routeString = '${route.settings.name}: ${route.settings.arguments}';
    final previousRouteString =
        '${previousRoute?.settings.name}: ${previousRoute?.settings.arguments}';
    final didPushString = didPush ? 'didPush' : 'didPop';

    logger
      ..d('route: $routeString')
      ..d('route.settings.name: ${route.settings.name}')
      ..d('route.settings.arguments: ${route.settings.arguments}');
    firebaseCrashlytics.setCustomKey('route', routeString);

    logger
      ..d('previousRoute: $previousRoute')
      ..d('previousRoute.settings.name: ${previousRoute?.settings.name}')
      ..d('previousRoute.settings.arguments: ${previousRoute?.settings.arguments}');
    firebaseCrashlytics.setCustomKey('previousRoute', previousRouteString);

    logger.d('navigate: $didPushString');
    firebaseCrashlytics.setCustomKey('navigate', didPushString);
  }
}
