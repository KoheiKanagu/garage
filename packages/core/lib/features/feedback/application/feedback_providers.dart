import 'dart:io';

import 'package:core/features/configure/application/device_info_providers.dart';
import 'package:core/features/configure/application/package_info_providers.dart';
import 'package:core/features/feedback/domain/feedback_device_info.dart';
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
