import 'dart:async';

import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_manager_delegate.g.dart';

@riverpod
_LocationManagerDelegate _locationManagerDelegate(
  _LocationManagerDelegateRef ref,
) {
  final controller = _LocationManagerDelegate(
    didChangeAuthorizationStream: StreamController.broadcast(),
    didDetermineStateStream: StreamController.broadcast(),
    didStartMonitoringStream: StreamController.broadcast(),
  );

  LocationManagerDelegate.setup(controller);

  return controller;
}

class _LocationManagerDelegate implements LocationManagerDelegate {
  const _LocationManagerDelegate({
    required this.didChangeAuthorizationStream,
    required this.didDetermineStateStream,
    required this.didStartMonitoringStream,
  });

  final StreamController<AuthorizationStatus> didChangeAuthorizationStream;

  final StreamController<
      ({
        Region region,
        RegionState state,
      })> didDetermineStateStream;

  final StreamController<
      ({
        Region region,
        String? error,
      })> didStartMonitoringStream;

  @override
  void didChangeAuthorization(AuthorizationStatus status) {
    didChangeAuthorizationStream.add(status);
  }

  @override
  void didDetermineState(Region region, RegionState state) {
    didDetermineStateStream.add(
      (
        region: region,
        state: state,
      ),
    );
  }

  @override
  void didStartMonitoring(Region region, String? error) {
    didStartMonitoringStream.add(
      (
        region: region,
        error: error,
      ),
    );
  }
}

@riverpod
Stream<AuthorizationStatus> locationManagerDidChangeAuthorization(
  LocationManagerDidChangeAuthorizationRef ref,
) =>
    ref
        .watch(_locationManagerDelegateProvider)
        .didChangeAuthorizationStream
        .stream;

@riverpod
Raw<
    Stream<
        ({
          Region region,
          RegionState state,
        })>> locationManagerDidDetermineState(
  LocationManagerDidDetermineStateRef ref,
) =>
    ref.watch(_locationManagerDelegateProvider).didDetermineStateStream.stream;

@riverpod
Stream<
    ({
      Region region,
      String? error,
    })> locationManagerDidStartMonitoring(
  LocationManagerDidStartMonitoringRef ref,
) =>
    ref.watch(_locationManagerDelegateProvider).didStartMonitoringStream.stream;
