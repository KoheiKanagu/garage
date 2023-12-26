import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:listen_to_music_by_location/features/home/presentation/home_page.dart';

part 'home_route.g.dart';

@TypedGoRoute<HomePageRoute>(
  path: HomePageRoute.path,
)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
