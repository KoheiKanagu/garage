const kUseFirebaseEmulator = false;

/// Identity Platform tenant id
late final String kTenantId;

/// Firestore database id
String get kDatabaseId {
  final ids = kTenantId.split('-')..removeLast();
  return ids.join('-');
}

late final AppEnv appEnv;

final kAppEnvDev = appEnv == AppEnv.dev;
final kAppEnvProd = appEnv == AppEnv.prod;

enum AppEnv {
  dev,
  prod,
}
