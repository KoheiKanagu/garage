import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_status.freezed.dart';
part 'service_status.g.dart';

@freezed
class ServiceStatus with _$ServiceStatus {
  const factory ServiceStatus({
    @Default(Status.down) Status status,
  }) = _ServiceStatus;

  factory ServiceStatus.fromJson(Json json) => _$ServiceStatusFromJson(json);

  static FromFirestore<ServiceStatus> get fromFirestore =>
      (snapshot, _) => ServiceStatus.fromJson(
            snapshot.data() ?? {},
          );

  static ToFirestore<ServiceStatus> get toFirestore =>
      (data, _) => data.toJson();
}

enum Status {
  up,
  down,
  ;
}
