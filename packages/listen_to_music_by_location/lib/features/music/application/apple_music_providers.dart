import 'package:app_links/app_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'apple_music_providers.g.dart';

@riverpod
Raw<Stream<Uri>> appLinksUriLink(
  AppLinksUriLinkRef ref,
) =>
    AppLinks().uriLinkStream;

@riverpod
Stream<String> appLinksMusicId(
  AppLinksMusicIdRef ref,
) =>
    ref
        .watch(appLinksUriLinkProvider)
        .where(
          (event) => event.host == 'shared',
        )
        .map(
          (event) => Uri.tryParse(
            event.pathSegments.first,
          ),
        )
        .where(
          (event) => event?.host == 'music.apple.com',
        )
        .map((event) => event?.queryParameters['i'])
        .where((event) => event != null)
        .cast<String>();
