import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_providers.g.dart';

/// [IdTokenResult]を取得する
/// サインインしていないなどで、IdTokenResultが取得できない場合は返さない
@riverpod
Stream<IdTokenResult> firebaseUserIdTokenResult(
  FirebaseUserIdTokenResultRef ref, {
  bool forceRefresh = false,
}) =>
    ref
        .watch(firebaseAuthProvider)
        .userChanges()
        .where((event) => event != null)
        .asyncMap(
          (event) => event!.getIdTokenResult(forceRefresh),
        );

/// UIDを取得する
/// サインインしていないなどで、UIDが取得できない場合は返さない
@riverpod
Stream<String> firebaseUserUid(
  FirebaseUserUidRef ref,
) =>
    ref
        .watch(firebaseAuthProvider)
        .userChanges()
        .where((event) => event != null)
        .map((event) => event!.uid);

/// サインインしているかどうか
@riverpod
Stream<bool> firebaseUserIsSignedIn(
  FirebaseUserIsSignedInRef ref,
) =>
    ref.watch(firebaseAuthProvider).userChanges().map(
          (event) => event != null,
        );

/// サインインをした後、Userドキュメントが取得できるまで待つ
@riverpod
Future<void> firebaseSignIn(FirebaseSignInRef ref) async {
  logger.d('signIn');

  // 初期化が完了するまで待つ
  final current = await ref.read(firebaseAuthProvider).authStateChanges().first;

  final String uid;
  if (current == null) {
    logger.i('not signed in');

    final credential = await ref.read(firebaseAuthProvider).signInAnonymously();
    uid = credential.user?.uid ?? '';
  } else {
    logger.i('already signed in');

    uid = current.uid;
  }

  if (uid.isEmpty) {
    throw Exception('uid is empty');
  }

  logger.d('await user document');

  await ref.watch(userDocumentSnapshotProvider(uid).future).catchError(
        (_, __) => throw Exception('not found user document: $uid'),
      );

  logger.d('success signIn');
}

/// SharedPreferencesとUser Documentの削除が完了するまで待った後、サインアウトする
@riverpod
Future<void> firebaseUserDelete(
  FirebaseUserDeleteRef ref,
) async {
  await ref.read(firebaseAnalyticsProvider).logEvent(
        name: 'delete_all',
      );

  logger.d('deleteUser');
  await ref
      .read(firebaseFunctionsProvider)
      .httpsCallable('deleteUser')
      .call<void>();

  logger.d('clear SharedPreferences');
  await ref.read(sharedPreferencesClearProvider.future);

  logger.d('signOut');
  await ref.read(firebaseAnalyticsProvider).logEvent(
        name: 'sign_out',
      );

  await ref.read(firebaseAuthProvider).signOut();
  logger.d('success signOut');
}

/// サインインしているアカウントのプロバイダーを取得する
@riverpod
Stream<List<String>> firebaseUserLinkedProviders(
  FirebaseUserLinkedProvidersRef ref,
) =>
    ref
        .watch(firebaseAuthProvider)
        .userChanges()
        .map(
          (event) => event?.providerData.map((e) => e.providerId).toList(),
        )
        .where((event) => event != null)
        .map((event) => event!);

/// リンクしているプロバイダーを解除する
@riverpod
Future<void> firebaseUserUnlinkProvider(
  FirebaseUserUnlinkProviderRef ref,
  String providerId,
) async {
  final user = await ref
      .read(firebaseAuthProvider)
      .userChanges()
      .where((event) => event != null)
      .first;
  await user!.unlink(providerId);
}
