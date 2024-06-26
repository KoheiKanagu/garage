import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_user_providers.g.dart';

/// [fb_auth.User]を取得する
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
@riverpod
Stream<fb_auth.User?> firebaseUser(
  FirebaseUserRef ref,
) =>
    ref.watch(firebaseAuthProvider).userChanges();

/// [fb_auth.IdTokenResult]を取得する
///
/// サインインしていない場合はnullを返す
///
/// 機密情報が含まれるため、[kAppEnvProd]の場合はログを抑制している
/// Providerの名称を変える場合は、[talkerRiverpodObserver] も変更すること
@riverpod
Future<fb_auth.IdTokenResult?> firebaseUserIdTokenResult(
  FirebaseUserIdTokenResultRef ref, {
  bool forceRefresh = false,
}) =>
    ref
        .watch(firebaseUserProvider.future)
        .then((value) => value?.getIdTokenResult(forceRefresh));

/// UIDを取得する
///
/// サインインしていない場合はnullを返す
@riverpod
Future<String?> firebaseUserUid(
  FirebaseUserUidRef ref,
) =>
    ref.watch(
      firebaseUserProvider.selectAsync(
        (value) => value?.uid,
      ),
    );

/// サインインしているかどうか
@riverpod
Future<bool> firebaseUserIsSignedIn(
  FirebaseUserIsSignedInRef ref,
) =>
    ref.watch(
      firebaseUserUidProvider.selectAsync(
        (value) => value != null,
      ),
    );

/// サインインをした後、Userドキュメントが取得できるまで待つ
@riverpod
Future<void> firebaseSignIn(FirebaseSignInRef ref) async {
  logger.debug('signIn');

  // 初期化が完了するまで待つ
  final current =
      await ref.watch(firebaseAuthProvider).authStateChanges().first;

  final String uid;
  if (current == null) {
    logger.info('not signed in');

    final credential =
        await ref.watch(firebaseAuthProvider).signInAnonymously();
    uid = credential.user?.uid ?? '';
  } else {
    logger.info('already signed in');

    uid = current.uid;
  }

  if (uid.isEmpty) {
    throw Exception('uid is empty');
  }

  logger.debug('await user document');

  await ref.watch(userDocumentSnapshotProvider(uid).future).catchError(
        (_, __) => throw Exception('not found user document: $uid'),
      );

  logger.debug('success signIn');
}

/// SharedPreferencesとUser Documentの削除が完了するまで待った後、サインアウトする
@riverpod
Future<void> firebaseUserDelete(
  FirebaseUserDeleteRef ref,
) async {
  await ref.watch(firebaseAnalyticsProvider).logEvent(
        name: 'delete_all',
      );

  logger.debug('deleteUser');
  await ref
      .watch(firebaseFunctionsProvider)
      .httpsCallable('deleteUser')
      .call<void>();

  logger.debug('clear SharedPreferences');
  await ref.watch(sharedPreferencesControllerProvider).clear();

  await ref.watch(firebaseAuthProvider).signOut();
  logger.debug('success signOut');
}

/// SharedPreferencesの削除が完了するまで待った後、サインアウトする
@riverpod
Future<void> firebaseUserSignOut(
  FirebaseUserSignOutRef ref,
) async {
  await ref.watch(firebaseAnalyticsProvider).logEvent(
        name: 'sign_out',
      );

  logger.debug('clear SharedPreferences');
  await ref.watch(sharedPreferencesControllerProvider).clear();

  await ref.watch(firebaseAuthProvider).signOut();
  logger.debug('success signOut');
}

/// サインインしているアカウントのプロバイダーを取得する
@riverpod
Future<List<String>?> firebaseUserLinkedProviders(
  FirebaseUserLinkedProvidersRef ref,
) =>
    ref.watch(
      firebaseUserProvider.selectAsync(
        (value) => value?.providerData
            .map(
              (e) => e.providerId,
            )
            .toList(),
      ),
    );

/// リンクしているプロバイダーを解除する
@riverpod
Future<void> firebaseUserUnlinkProvider(
  FirebaseUserUnlinkProviderRef ref,
  String providerId,
) async {
  final user = await ref.watch(firebaseUserProvider.future);
  await user!.unlink(providerId);
}
