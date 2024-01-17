// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'music_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $locamusicDetailPageRoute,
    ];

RouteBase get $locamusicDetailPageRoute => GoRouteData.$route(
      path: '/locamusic/:documentId',
      factory: $LocamusicDetailPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'awaiting',
          factory: $MusicAwaitingPageRouteExtension._fromState,
        ),
      ],
    );

extension $LocamusicDetailPageRouteExtension on LocamusicDetailPageRoute {
  static LocamusicDetailPageRoute _fromState(GoRouterState state) =>
      LocamusicDetailPageRoute(
        state.pathParameters['documentId']!,
      );

  String get location => GoRouteData.$location(
        '/locamusic/${Uri.encodeComponent(documentId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MusicAwaitingPageRouteExtension on MusicAwaitingPageRoute {
  static MusicAwaitingPageRoute _fromState(GoRouterState state) =>
      MusicAwaitingPageRoute(
        state.pathParameters['documentId']!,
      );

  String get location => GoRouteData.$location(
        '/locamusic/${Uri.encodeComponent(documentId)}/awaiting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
