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
    (
      Region region,
      RegionState state,
    )> myFlutterApiDidDetermineState(
  MyFlutterApiDidDetermineStateRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).didDetermineStateStream.stream;

@riverpod
Stream<
    (
      Region region,
      String? error,
    )> myFlutterApiDidStartMonitoring(
  MyFlutterApiDidStartMonitoringRef ref,
) =>
    ref.watch(myFlutterApiControllerProvider).didStartMonitoringStream.stream;

class MyFlutterApiController implements MyFlutterApi {
  const MyFlutterApiController({
    required this.myMapHostApi,
    required this.didChangeAuthorizationStream,
    required this.didDetermineStateStream,
    required this.didStartMonitoringStream,
  });

  final MyMapHostApi myMapHostApi;

  final StreamController<AuthorizationStatus> didChangeAuthorizationStream;

  final StreamController<
      (
        Region region,
        RegionState state,
      )> didDetermineStateStream;

  final StreamController<
      (
        Region region,
        String? error,
      )> didStartMonitoringStream;

  @override
  void onLongPressedMap(double latitude, double longitude) {
    myMapHostApi.addAnnotation(
      identifier: 'identifier',
      latitude: latitude,
      longitude: longitude,
      title: 'タイトル',
      circleDistance: 500,
    );
  }

  @override
  void onTapCircle(String identifier) {
    print(identifier);
  }

  @override
  void didChangeAuthorization(AuthorizationStatus status) {
    didChangeAuthorizationStream.add(status);
  }

  @override
  void didDetermineState(Region region, RegionState state) {
    didDetermineStateStream.add(
      (region, state),
    );
  }

  @override
  void didStartMonitoring(Region region, String? error) {
    didStartMonitoringStream.add(
      (region, error),
    );
  }

  @override
  void didUpdateLocations(double latitude, double longitude) {
    // TODO: implement didUpdateLocations
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
