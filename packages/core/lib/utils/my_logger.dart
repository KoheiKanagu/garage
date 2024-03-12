import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
