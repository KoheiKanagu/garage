import 'package:core/core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kAppEnvProd) {
      final hidden = {
        // [firebaseUserProvider]
        'firebaseUserProvider',
        // [firebaseUserIdTokenResultProvider]
        'firebaseUserIdTokenResult',
      };

      //　機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制
      if (hidden.contains(provider.name) && kAppEnvProd) {
        logger.fine(
          {
            'name': provider.name,
            'runtimeType': provider.runtimeType,
            'newValue': '**hidden**',
          },
        );
        return;
      }
    }

    logger.fine(
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
    logger.severe(
      {
        'name': provider.name,
        'runtimeType': provider.runtimeType,
        'error': error,
        'stackTrace': stackTrace,
      },
    );
  }
}
