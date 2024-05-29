import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

const _host = 'localhost';

@riverpod
FirebaseCrashlytics firebaseCrashlytics(FirebaseCrashlyticsRef _) =>
    FirebaseCrashlytics.instance;

@riverpod
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef _) {
  final instance = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: kDatabaseId,
  );

  if (kUseFirebaseEmulator) {
    return instance..useFirestoreEmulator(_host, 8080);
  }
  return instance;
}

@riverpod
FirebaseFirestore firebaseFirestoreDefault(
  FirebaseFirestoreDefaultRef ref,
) {
  final instance = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
  );

  if (kUseFirebaseEmulator) {
    return instance..useFirestoreEmulator(_host, 8080);
  }
  return instance;
}

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef _) {
  final instance = FirebaseAuth.instance..tenantId = kTenantId;

  if (kUseFirebaseEmulator) {
    return instance..useAuthEmulator(_host, 9099);
  }
  return instance;
}

@riverpod
FirebaseAnalytics firebaseAnalytics(FirebaseAnalyticsRef _) =>
    FirebaseAnalytics.instance;

@riverpod
FirebasePerformance firebasePerformance(FirebasePerformanceRef _) =>
    FirebasePerformance.instance;

@riverpod
FirebaseFunctions firebaseFunctions(FirebaseFunctionsRef _) {
  final instance = FirebaseFunctions.instanceFor(
    region: 'asia-northeast1',
  );

  if (kUseFirebaseEmulator) {
    return instance..useFunctionsEmulator(_host, 5001);
  }
  return instance;
}

@riverpod
Future<FirebaseRemoteConfig> firebaseRemoteConfig(
  FirebaseRemoteConfigRef ref,
) async {
  final instance = FirebaseRemoteConfig.instance;
  if (kDebugMode) {
    await instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 30),
      ),
    );
  }
  return instance;
}
