import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_providers.g.dart';

const kFeedbackShortcut = 'feedback_shortcut';

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
) {
  return ref
      .read(firebaseFirestoreDefaultProvider)
      .collection(CollectionPath.kFeedbacks)
      .withConverter(
        fromFirestore: FeedbackData.fromFirestore,
        toFirestore: FeedbackData.toFirestore,
      );
}

@riverpod
Future<void> feedbackSubmit(
  FeedbackSubmitRef ref,
  UserFeedback userFeedback, {
  required FeedbackFrom feedbackFrom,
}) async {
  final data = userFeedback.extra!['data'] as FeedbackData;

  final feedbackData = data.copyWith(
    screenshotBase64: base64Encode(userFeedback.screenshot),
    from: feedbackFrom,
  );

  await ref.read(feedbackCollectionReferenceProvider).add(feedbackData);
}

@riverpod
Future<FeedbackData> feedbackDataState(
  FeedbackDataStateRef ref,
) async {
  final currentUser = await ref.watch(firebaseUserProvider.future);

  return FeedbackData(
    uid: currentUser?.uid,
    email: null,
    message: '',
    deviceInfo: await ref.watch(feedbackDeviceInfoProvider.future),
    type: FeedbackType.impression,
  );
}

@riverpod
class FeedbackDataController extends _$FeedbackDataController {
  static final formKey = GlobalKey<FormState>();

  @override
  Future<FeedbackData> build() {
    return ref.watch(feedbackDataStateProvider.future);
  }

  bool validateEmail(String? email) {
    // 1024文字以上はエラー
    if ((email ?? '').length > 1024) {
      return false;
    }
    return true;
  }

  void updateEmail(String? email) {
    state = state.whenData(
      (value) => value.copyWith(
        email: email,
      ),
    );
  }

  bool validateMessage(String? message) {
    // 空の場合はエラー
    if (message?.trim().isEmpty ?? true) {
      return false;
    }
    return true;
  }

  void updateMessage(String? message) {
    if (!validateMessage(message)) {
      return;
    }

    state = state.whenData(
      (value) => value.copyWith(
        message: message!,
      ),
    );
  }

  void updateType(FeedbackType type) {
    state = state.whenData(
      (value) => value.copyWith(
        type: type,
      ),
    );
  }

  FeedbackData? commit() {
    formKey.currentState?.save();
    final validated = formKey.currentState?.validate() ?? false;

    return validated ? state.asData?.value : null;
  }
}
