import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
import 'package:feedback/feedback.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_providers.g.dart';

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
      .collection(CollectionPath.kFeedback)
      .withConverter(
        fromFirestore: FeedbackData.fromFirestore,
        toFirestore: FeedbackData.toFirestore,
      );
}

@riverpod
Future<void> feedbackSubmit(
  FeedbackSubmitRef ref,
  UserFeedback userFeedback,
) async {
  final data = userFeedback.extra!['data'] as FeedbackData;

  final feedbackData = FeedbackData(
    uid: data.uid,
    email: data.email,
    message: data.message,
    screenshotBase64: base64Encode(userFeedback.screenshot),
    deviceInfo: data.deviceInfo,
  );

  await ref.read(feedbackCollectionReferenceProvider).add(feedbackData);
}
