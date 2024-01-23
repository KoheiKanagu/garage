import 'dart:developer';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roggle/roggle.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.d(
      {
        'name': provider.name,
        'runtimeType': provider.runtimeType,
        'newValue': newValue,
      },
    );
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      {
        'name': provider.name,
        'runtimeType': provider.runtimeType,
        'error': error,
        'stackTrace': stackTrace,
      },
    );
  }
}

final singlePrettyPrinter = SinglePrettyPrinter();

class MyCrashlyticsPrinter extends CrashlyticsPrinter {
  MyCrashlyticsPrinter({
    required super.errorLevel,
    required super.onError,
    super.onLog,
  });

  @override
  List<String> log(LogEvent event) {
    if (onLog != null) {
      final message = _formatMessage(
        level: event.level,
        message: stringifyMessage(event.message),
        time: event.time,
      );
      onLog!.call(CrashlyticsLogEvent(event.level, message));
    }

    if (event.level.index >= errorLevel.index) {
      Object error;
      if (event.error != null) {
        // If error is not null, it will be sent with priority.
        error = event.error!;
      } else if (event.message is Exception) {
        error = event.message as Exception;
      } else if (event.message is Error) {
        error = event.message as Error;
      } else {
        error = stringifyMessage(event.message);
      }

      onError.call(
        CrashlyticsErrorEvent(
          event.level,
          error,
          event.stackTrace ?? StackTrace.current,
        ),
      );
    }

    return [];
  }

  String _formatMessage({
    required Level level,
    required String message,
    required DateTime time,
  }) {
    final color = getLevelColor(level);
    final fixed = formatFixed(level: level, time: time);
    return color('$fixed$message');
  }
}

final logger = Roggle.crashlytics(
  printer: MyCrashlyticsPrinter(
    errorLevel: Level.warning,
    onError: (event) {
      final fatal = switch (event.level) {
        Level.error || Level.fatal => true,
        _ => false,
      };

      // https://github.com/firebase/flutterfire/issues/11029#issuecomment-1774077570
      final newStackTrace = StackTrace.fromString(
        event.stack
            .toString()
            .split('\n')
            .map(
              (e) => e.replaceFirst(RegExp(r'abs [\da-f]+'), 'abs 0'),
            )
            .join('\n'),
      );

      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordError(
          event.exception,
          newStackTrace,
          fatal: fatal,
        );
      }

      if (kDebugMode) {
        log(
          singlePrettyPrinter
              .log(
                LogEvent(
                  event.level,
                  event.exception,
                  error: event.exception,
                  stackTrace: event.stack,
                ),
              )
              .join('\n'),
        );
      }
    },
    onLog: (event) {
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.log(event.message);
      }

      if (kDebugMode) {
        log(
          singlePrettyPrinter
              .log(LogEvent(event.level, event.message))
              .join('\n'),
        );
      }
    },
  ),
);

extension RoggleExtension on Roggle {
  void dProvider(String name, Object? message) {
    logger.d('[$name]: $message');
  }

  void eProvider(String name, Object? message) {
    logger.e('[$name]: $message');
  }

  void wProvider(String name, Object? message) {
    logger.w('[$name]: $message');
  }

  void iProvider(String name, Object? message) {
    logger.i('[$name]: $message');
  }
}
