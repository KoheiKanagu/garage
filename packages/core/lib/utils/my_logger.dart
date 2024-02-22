import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    switch (appEnv) {
      AppEnv.dev => Level.ALL,
      AppEnv.prod => Level.FINE,
    },
    includeCallerInfo: switch (appEnv) {
      AppEnv.dev => true,
      AppEnv.prod => false,
    },
  )
  ..mode = LoggerMode.print
  ..onLogged = (log, info) {
    // リリースビルドのみFirebaseCrashlyticsに送信する
    if (kReleaseMode) {
      FirebaseCrashlytics.instance.log(log);

      if (info.level >= Level.SEVERE) {
        // 重大なエラー
        FirebaseCrashlytics.instance.recordError(
          log,
          StackTrace.fromString(
            info.callerFrame.toString(),
          ),
          fatal: true,
        );
      } else if (info.level == Level.WARNING) {
        // 警告
        FirebaseCrashlytics.instance.recordError(
          log,
          StackTrace.fromString(
            info.callerFrame.toString(),
          ),
        );
      }
    }
  };
