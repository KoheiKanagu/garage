import 'package:go_router/go_router.dart';

/// reference: https://github.com/flutter/flutter/issues/129833#issuecomment-1725216727
extension GoRouterExtension on GoRouter {
  String location() {
    final lastMatch = routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final location = matchList.uri.toString();
    return location;
  }
}
