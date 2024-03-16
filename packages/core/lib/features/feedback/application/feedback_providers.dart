import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
import 'package:core/features/feedback/domain/feedback_comment.dart';
import 'package:core/features/feedback/domain/feedback_extras.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_providers.g.dart';

const kFeedbackShortcut = 'feedback_shortcut';

final feedbackFormKey = GlobalKey<FormState>();

@riverpod
Future<FeedbackDeviceInfo> feedbackDeviceInfo(
  FeedbackDeviceInfoRef ref,
) async {
  final osVersion = await ref.watch(deviceInfoOsVersionProvider.future);

  final modelName = await ref.watch(deviceInfoModelNameProvider.future);

  final appVersion =
      // ignore: lines_longer_than_80_chars
      '${ref.watch(packageInfoVersionProvider)}+${ref.watch(packageInfoBuildNumberProvider)}';

  final appPackageName = ref.watch(packageInfoPackageNameProvider);

  return FeedbackDeviceInfo(
    osVersion: osVersion,
    modelName: modelName,
    locale: Platform.localeName,
    appVersion: appVersion,
    appPackageName: appPackageName,
  );
}

@riverpod
CollectionReference<FeedbackData> feedbackCollectionReference(
  FeedbackCollectionReferenceRef ref,
) =>
    ref
        .watch(firebaseFirestoreDefaultProvider)
        .collection(CollectionPath.kFeedbacks)
        .withConverter(
          fromFirestore: FeedbackData.fromFirestore,
          toFirestore: FeedbackData.toFirestore,
        );

@riverpod
CollectionReference<FeedbackComment> feedbackCommentCollectionReference(
  FeedbackCommentCollectionReferenceRef ref,
  String feedbackId,
) =>
    ref
        .watch(firebaseFirestoreDefaultProvider)
        .collection(CollectionPath.kFeedbacks)
        .doc(feedbackId)
        .collection(CollectionPath.kFeedbacksComments)
        .withConverter(
          fromFirestore: FeedbackComment.fromFirestore,
          toFirestore: FeedbackComment.toFirestore,
        );

@riverpod
Future<void> feedbackSubmit(
  FeedbackSubmitRef ref,
  UserFeedback userFeedback, {
  required FeedbackFrom feedbackFrom,
}) async {
  final extras = FeedbackExtras.fromMap(userFeedback.extra!);

  final feedbackData = extras.feedbackData;
  final feedbackComment = extras.feedbackComment.copyWith(
    attachments: [
      if (extras.attachScreenshot)
        UriData.fromBytes(
          userFeedback.screenshot,
          mimeType: 'image/png',
        ),
    ],
  );

  // フィードバックを作成
  final docRef =
      await ref.watch(feedbackCollectionReferenceProvider).add(feedbackData);

  // フィードバックにコメントを追加
  await ref.watch(feedbackCommentCollectionReferenceProvider(docRef.id)).add(
        feedbackComment,
      );
}

@riverpod
Future<FeedbackData> feedbackDataState(
  FeedbackDataStateRef ref,
) async {
  final (currentUser, deviceInfo) = (
    await ref.watch(firebaseUserProvider.future),
    await ref.watch(feedbackDeviceInfoProvider.future)
  );

  return FeedbackData(
    createdBy: currentUser?.uid,
    email: null,
    deviceInfo: deviceInfo,
    type: FeedbackType.impression,
  );
}

@riverpod
Future<FeedbackComment> feedbackCommentState(
  FeedbackCommentStateRef ref,
) async {
  final currentUser = await ref.watch(firebaseUserProvider.future);

  return FeedbackComment(
    createdBy: currentUser?.uid,
    message: '',
  );
}

@riverpod
String? feedbackValidateEmail(
  FeedbackValidateEmailRef ref, {
  required String? value,
  required String errorMessage,
}) {
  // 1024文字以上はエラー
  if ((value ?? '').length > 1024) {
    return null;
  }
  return errorMessage;
}

@riverpod
String? feedbackValidateMessage(
  FeedbackValidateMessageRef ref, {
  required String? value,
  required String errorMessage,
}) {
  // 空の場合はエラー
  if (value?.trim().isEmpty ?? true) {
    return null;
  }
  return errorMessage;
}

@riverpod
class FeedbackDataController extends _$FeedbackDataController {
  @override
  Future<FeedbackData> build() {
    return ref.watch(feedbackDataStateProvider.future);
  }

  void updateEmail(String? email) {
    final error = ref.watch(
      feedbackValidateEmailProvider(
        value: email,
        errorMessage: '',
      ),
    );

    if (error == null) {
      state = state.whenData(
        (value) => value.copyWith(
          email: email,
        ),
      );
    }
  }

  void updateType(FeedbackType type) {
    state = state.whenData(
      (value) => value.copyWith(
        type: type,
      ),
    );
  }
}

@riverpod
class FeedbackCommentController extends _$FeedbackCommentController {
  @override
  Future<FeedbackComment> build() {
    return ref.watch(feedbackCommentStateProvider.future);
  }

  void updateMessage(String? message) {
    final error = ref.watch(
      feedbackValidateMessageProvider(
        value: message,
        errorMessage: '',
      ),
    );

    if (error == null) {
      state = state.whenData(
        (value) => value.copyWith(
          message: message!,
        ),
      );
    }
  }
}
