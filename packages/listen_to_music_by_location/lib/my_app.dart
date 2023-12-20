import 'package:core/core.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/i18n/strings.g.dart';
import 'package:listen_to_music_by_location/routing/my_go_router.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BetterFeedback(
      child: MaterialApp.router(
        builder: (context, child) => MediaQueryPreview(context, child)
            // .disableDynamicIsland()
            // .textScale05()
            .textScale10()
            // .textScale15()
            // .textScale20()
            // .darkMode()
            // .android()
            .build(),
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routerConfig: ref.watch(myGoRouterProvider),
      ),
    );
  }
}
