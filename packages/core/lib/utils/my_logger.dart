import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final logger = TalkerFlutter.init(
  observer: kReleaseMode ? CrashlyticsTalkerObserver() : null,
);

class CrashlyticsTalkerObserver extends TalkerObserver {
  CrashlyticsTalkerObserver();

  @override
  void onError(TalkerError err) {
    FirebaseCrashlytics.instance.recordError(
      err.error,
      err.stackTrace,
      reason: err.message,
    );
  }

  @override
  void onException(TalkerException err) {
    FirebaseCrashlytics.instance.recordError(
      err.exception,
      err.stackTrace,
      reason: err.message,
    );
  }

  @override
  void onLog(TalkerData log) {
    FirebaseCrashlytics.instance.log(
      log.generateTextMessage(),
    );
  }
}

final talkerRiverpodObserver = TalkerRiverpodObserver(
  talker: logger,
  settings: TalkerRiverpodLoggerSettings(
    printProviderDisposed: true,
    providerFilter: (provider) {
      if (!kAppEnvProd) {
        final hidden = {
          // [firebaseUserProvider]
          'firebaseUserProvider',
          // [firebaseUserIdTokenResultProvider]
          'firebaseUserIdTokenResult',
        };

        //　機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制
        if (hidden.contains(provider.name)) {
          return false;
        }
      }
      return true;
    },
  ),
);
