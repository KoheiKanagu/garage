import 'dart:async';

import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_provider.g.dart';

@riverpod
MyFlutterApiController myFlutterApiController(
  MyFlutterApiControllerRef ref,
) {
  final controller = MyFlutterApiController(
    myMapHostApi: ref.watch(myMapHostApiProvider),
    didChangeAuthorizationStream: StreamController.broadcast(),
    didDetermineStateStream: StreamController.broadcast(),
    didStartMonitoringStream: StreamController.broadcast(),
    didUpdateLocationsStream: StreamController.broadcast(),
    onLongPressedMapStream: StreamController.broadcast(),
    onTapCircleStream: StreamController.broadcast(),
  );

  MyFlutterApi.setup(controller);

  return controller;
}

@riverpod
Stream<AuthorizationStatus> myFlutterApiDidChangeAuthorization(
  MyFlutterApiDidChangeAuthorizationRef ref,
) =>
    ref
        .watch(myFlutterApiControllerProvider)
        .didChangeAuthorizationStream
        .stream;

@riverpod
Stream<
    ({
      Region region,
      RegionState state,
    })> myFlutterApiDidDetermineState(
  MyFlutterApiDidDetermineStateRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).didDetermineStateStream.stream;

@riverpod
Stream<
    ({
      Region region,
      String? error,
    })> myFlutterApiDidStartMonitoring(
  MyFlutterApiDidStartMonitoringRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).didStartMonitoringStream.stream;

@riverpod
Stream<
    ({
      double latitude,
      double longitude,
    })> myFlutterApiDidUpdateLocations(
  MyFlutterApiDidUpdateLocationsRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).didUpdateLocationsStream.stream;

@riverpod
Stream<
    ({
      double latitude,
      double longitude,
    })> myFlutterApiOnLongPressedMap(
  MyFlutterApiOnLongPressedMapRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).onLongPressedMapStream.stream;

@riverpod
Stream<String> myFlutterApiOnTapCircle(
  MyFlutterApiOnTapCircleRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).onTapCircleStream.stream;

class MyFlutterApiController implements MyFlutterApi {
  const MyFlutterApiController({
    required this.myMapHostApi,
    required this.didChangeAuthorizationStream,
    required this.didDetermineStateStream,
    required this.didStartMonitoringStream,
    required this.didUpdateLocationsStream,
    required this.onLongPressedMapStream,
    required this.onTapCircleStream,
  });

  final MyMapHostApi myMapHostApi;

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

  final StreamController<
      ({
        double latitude,
        double longitude,
      })> didUpdateLocationsStream;

  final StreamController<
      ({
        double latitude,
        double longitude,
      })> onLongPressedMapStream;

  final StreamController<String> onTapCircleStream;

  @override
  void onLongPressedMap(double latitude, double longitude) {
    onLongPressedMapStream.add(
      (
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  void onTapCircle(String identifier) {
    onTapCircleStream.add(identifier);
  }

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

  @override
  void didUpdateLocations(double latitude, double longitude) {
    didUpdateLocationsStream.add(
      (
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }
}

@riverpod
MyMapHostApi myMapHostApi(
  MyMapHostApiRef ref,
) =>
    MyMapHostApi();

@riverpod
MyLocationHostApi myLocationHostApi(
  MyLocationHostApiRef ref,
) =>
    MyLocationHostApi();

@riverpod
MyMusicHostApi myMusicHostApi(
  MyMusicHostApiRef ref,
) =>
    MyMusicHostApi();
