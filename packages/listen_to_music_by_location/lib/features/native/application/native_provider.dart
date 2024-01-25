import 'dart:async';

import 'package:listen_to_music_by_location/features/native/application/location_manager_delegate.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_provider.g.dart';

@riverpod
MapPageMapView mapPageMapView(
  MapPageMapViewRef ref,
) =>
    MapPageMapView();

@riverpod
LocamusicDetailPageMapView locamusicDetailPageMapView(
  LocamusicDetailPageMapViewRef ref,
) =>
    LocamusicDetailPageMapView();

@riverpod
LocationManager locationManager(
  LocationManagerRef ref,
) =>
    LocationManager();

/// 位置情報の権限をStreamで取得する
@riverpod
Stream<AuthorizationStatus> locationManagerCurrentPermissionStatusStream(
  LocationManagerCurrentPermissionStatusStreamRef ref,
) async* {
  final current =
      await ref.read(locationManagerProvider).currentPermissionStatus();
  yield current;

  final result =
      await ref.watch(locationManagerDidChangeAuthorizationProvider.future);
  yield result;
}

@riverpod
MusicKit musicKit(
  MusicKitRef ref,
) =>
    MusicKit();


@riverpod
OpenSettings openSettings(
  OpenSettingsRef ref,
) =>
    OpenSettings();
