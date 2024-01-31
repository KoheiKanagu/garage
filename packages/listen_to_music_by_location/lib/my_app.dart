import 'package:core/core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/native/application/location_manager_delegate.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:listen_to_music_by_location/routing/my_go_router.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      // ジオフェンスの状態が変更されたら呼ばれる
      locationManagerDidDetermineStateProvider.future,
      (_, next) async {
        final (:region, :state) = await next;

        if (state == RegionState.inside) {
          logger.i(
            // ignore: lines_longer_than_80_chars
            'on inside locationManagerDidDetermineStateProvider region: ${region.encode()}, state: $state',
          );
        }
      },
    );

    final router = ref.watch(myGoRouterProvider);

    const theme = CupertinoThemeData(
      primaryColor: CupertinoDynamicColor.withBrightness(
        color: Color(0xFFFA233B),
        darkColor: Color(0xFFFB5C74),
      ),
    );

    return MyBetterFeedback(
      cupertinoThemeData: theme,
      child: CupertinoApp.router(
        builder: (context, child) => MediaQueryPreview(
          context,
          child,
          cupertino: true,
        )
            // .disableDynamicIsland()
            // .textScale05()
            .textScale10()
            // .textScale15()
            // .textScale20()
            // .android()
            .build(),
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FirebaseUILocalizations.delegate,
        ],
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
