import 'dart:async';

import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_view_delegate.g.dart';

@riverpod
_MapViewDelegate _mapViewDelegate(
  _MapViewDelegateRef ref,
) {
  final controller = _MapViewDelegate(
    onLongPressedMapStream: StreamController.broadcast(),
    onTapCircleStream: StreamController.broadcast(),
    mapViewDidFinishLoadingMapStream: StreamController.broadcast(),
  );

  MapViewDelegate.setup(controller);

  return controller;
}

class _MapViewDelegate implements MapViewDelegate {
  _MapViewDelegate({
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
Stream<
    ({
      MyMapViewType viewType,
      double latitude,
      double longitude,
    })> mapPageMapViewOnLongPressedMap(
  MapPageMapViewOnLongPressedMapRef ref,
) =>
    ref.watch(_mapViewDelegateProvider).onLongPressedMapStream.stream;

@riverpod
Stream<
    ({
      MyMapViewType viewType,
      String identifier,
    })> mapPageMapViewOnTapCircle(
  MapPageMapViewOnTapCircleRef ref,
) =>
    ref.watch(_mapViewDelegateProvider).onTapCircleStream.stream;

@riverpod
Stream<MyMapViewType> mapPageMapViewMapViewDidFinishLoadingMap(
  MapPageMapViewMapViewDidFinishLoadingMapRef ref,
) =>
    ref.watch(_mapViewDelegateProvider).mapViewDidFinishLoadingMapStream.stream;
