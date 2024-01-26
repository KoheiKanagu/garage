import 'package:core/core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:listen_to_music_by_location/routing/my_go_router.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(myGoRouterProvider);

    return MyBetterFeedback(
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
        theme: const CupertinoThemeData(
          primaryColor: CupertinoDynamicColor.withBrightness(
            color: Color(0xFFFA233B),
            darkColor: Color(0xFFFB5C74),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
