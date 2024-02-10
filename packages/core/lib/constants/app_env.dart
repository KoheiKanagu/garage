const kUseFirebaseEmulator = false;

/// Identity Platform tenant id
late final String kTenantId;

/// Firestore database id
String get kDatabaseId {
  final ids = kTenantId.split('-')..removeLast();
  return ids.join('-');
}

// ignore: comment_references
/// App Store id. Used for [InAppReview]
late final String kAppStoreId;

/// [appFlavor constant \- services library \- Dart API](https://api.flutter.dev/flutter/services/appFlavor-constant.html)
const _appFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR');

final appEnv = switch (_appFlavor) {
  'dev' => AppEnv.dev,
  'prod' => AppEnv.prod,
  _ => throw Exception('Invalid AppEnv: $_appFlavor'),
};

final kAppEnvDev = appEnv == AppEnv.dev;
final kAppEnvProd = appEnv == AppEnv.prod;

enum AppEnv {
  dev,
  prod,
}
