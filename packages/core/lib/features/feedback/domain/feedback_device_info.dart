import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_device_info.freezed.dart';
part 'feedback_device_info.g.dart';

@freezed
class FeedbackDeviceInfo with _$FeedbackDeviceInfo {
  const factory FeedbackDeviceInfo({
    required String osVersion,
    required String modelName,
    required String locale,
    required String appVersion,
    required String appPackageName,
  }) = _FeedbackDeviceInfo;

  factory FeedbackDeviceInfo.fromJson(Json json) =>
      _$FeedbackDeviceInfoFromJson(json);
}
