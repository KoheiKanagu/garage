// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'preview_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $previewPageRoute,
    ];

RouteBase get $previewPageRoute => GoRouteData.$route(
      path: '/preview',
      factory: $PreviewPageRouteExtension._fromState,
    );

extension $PreviewPageRouteExtension on PreviewPageRoute {
  static PreviewPageRoute _fromState(GoRouterState state) =>
      const PreviewPageRoute();

  String get location => GoRouteData.$location(
        '/preview',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
