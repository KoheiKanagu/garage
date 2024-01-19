import 'dart:async';

import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'native_provider.g.dart';

@riverpod
MyFlutterApiController myFlutterApiController(
  MyFlutterApiControllerRef ref,
) {
  final controller = MyFlutterApiController(
    didChangeAuthorizationStream: StreamController.broadcast(),
    didDetermineStateStream: StreamController.broadcast(),
    didStartMonitoringStream: StreamController.broadcast(),
    didUpdateLocationsStream: StreamController.broadcast(),
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

class MyFlutterApiController implements MyFlutterApi {
  const MyFlutterApiController({
    required this.didChangeAuthorizationStream,
    required this.didDetermineStateStream,
    required this.didStartMonitoringStream,
    required this.didUpdateLocationsStream,
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

  final StreamController<
      ({
        double latitude,
        double longitude,
      })> didUpdateLocationsStream;

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
MyFlutterApiMapViewDelegateController myFlutterApiMapViewDelegateController(
  MyFlutterApiMapViewDelegateControllerRef ref,
) {
  final controller = MyFlutterApiMapViewDelegateController(
    onLongPressedMapStream: StreamController.broadcast(),
    onTapCircleStream: StreamController.broadcast(),
    mapViewDidFinishLoadingMapStream: StreamController.broadcast(),
  );

  MyFlutterApiMapViewDelegate.setup(controller);

  return controller;
}

@riverpod
Stream<
    ({
      MyMapViewType viewType,
      double latitude,
      double longitude,
    })> myFlutterApiOnLongPressedMap(
  MyFlutterApiOnLongPressedMapRef ref,
) =>
    ref
        .watch(myFlutterApiMapViewDelegateControllerProvider)
        .onLongPressedMapStream
        .stream;

@riverpod
Stream<
    ({
      MyMapViewType viewType,
      String identifier,
    })> myFlutterApiOnTapCircle(
  MyFlutterApiOnTapCircleRef ref,
) =>
    ref
        .watch(myFlutterApiMapViewDelegateControllerProvider)
        .onTapCircleStream
        .stream;

@riverpod
Stream<MyMapViewType> myFlutterApiMapViewDidFinishLoadingMap(
  MyFlutterApiMapViewDidFinishLoadingMapRef ref,
) =>
    ref
        .watch(myFlutterApiMapViewDelegateControllerProvider)
        .mapViewDidFinishLoadingMapStream
        .stream;

class MyFlutterApiMapViewDelegateController
    implements MyFlutterApiMapViewDelegate {
  MyFlutterApiMapViewDelegateController({
    required this.onLongPressedMapStream,
    required this.onTapCircleStream,
    required this.mapViewDidFinishLoadingMapStream,
  });

  final StreamController<
      ({
        MyMapViewType viewType,
        double latitude,
        double longitude,
      })> onLongPressedMapStream;

  final StreamController<
      ({
        MyMapViewType viewType,
        String identifier,
      })> onTapCircleStream;

  final StreamController<MyMapViewType> mapViewDidFinishLoadingMapStream;

  @override
  void onLongPressedMap(
    MyMapViewType viewType,
    double latitude,
    double longitude,
  ) {
    onLongPressedMapStream.add(
      (
        viewType: viewType,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  void onTapCircle(
    MyMapViewType viewType,
    String identifier,
  ) {
    onTapCircleStream.add(
      (
        viewType: viewType,
        identifier: identifier,
      ),
    );
  }

  @override
  void mapViewDidFinishLoadingMap(MyMapViewType viewType) {
    mapViewDidFinishLoadingMapStream.add(viewType);
  }
}

@riverpod
MyMapHostApi myMapHostApi(
  MyMapHostApiRef ref,
) =>
    MyMapHostApi();

@riverpod
MyNonInteractiveMapHostApi myNonInteractiveMapHostApi(
  MyNonInteractiveMapHostApiRef ref,
) =>
    MyNonInteractiveMapHostApi();

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
