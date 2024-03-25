import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
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

  final appName = ref.watch(packageInfoAppNameProvider);

  return FeedbackDeviceInfo(
    osVersion: osVersion,
    modelName: modelName,
    locale: Platform.localeName,
    appVersion: appVersion,
    appPackageName: appPackageName,
    appName: appName,
  );
}

@riverpod
CollectionReference<FeedbackData> feedbacksCollectionReference(
  FeedbacksCollectionReferenceRef ref,
) =>
    ref
        .watch(firebaseFirestoreDefaultProvider)
        .collection(CollectionPath.kFeedbacks)
        .withConverter(
          fromFirestore: FeedbackData.fromFirestore,
          toFirestore: FeedbackData.toFirestore,
        );

@riverpod
CollectionReference<FeedbackComment> feedbackCommentsCollectionReference(
  FeedbackCommentsCollectionReferenceRef ref,
) =>
    ref
        .watch(firebaseFirestoreDefaultProvider)
        .collection(CollectionPath.kFeedbackComments)
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

  // フィードバックを作成
  final feedbackData = extras.feedbackData;
  final docRef =
      await ref.watch(feedbacksCollectionReferenceProvider).add(feedbackData);
  final feedbackId = docRef.id;

  // コメントを作成
  final feedbackComment = extras.feedbackComment.copyWith(
    attachments: [
      if (extras.attachScreenshot)
        FeedbackAttachment(
          path: UriData.fromBytes(
            userFeedback.screenshot,
            mimeType: 'image/png',
          ),
        ),
    ],
    feedbackId: feedbackId,
  );
  await ref
      .watch(feedbackCommentsCollectionReferenceProvider)
      .add(feedbackComment);
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
    return errorMessage;
  }
  return null;
}

@riverpod
String? feedbackValidateMessage(
  FeedbackValidateMessageRef ref, {
  required String? value,
  required String errorMessage,
}) {
  // 空の場合はエラー
  if (value?.trim().isEmpty ?? true) {
    return errorMessage;
  }
  return null;
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
          message: message,
        ),
      );
    }
  }
}
