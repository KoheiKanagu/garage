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
        MapViewType viewType,
        double latitude,
        double longitude,
      })> onLongPressedMapStream;

  final StreamController<
      ({
        MapViewType viewType,
        String identifier,
      })> onTapCircleStream;

  final StreamController<MapViewType> mapViewDidFinishLoadingMapStream;

  @override
  void onLongPressedMap(
    MapViewType viewType,
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
    MapViewType viewType,
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
  void mapViewDidFinishLoadingMap(MapViewType viewType) {
    mapViewDidFinishLoadingMapStream.add(viewType);
  }
}

@riverpod
Stream<
    ({
      MapViewType viewType,
      double latitude,
      double longitude,
    })> mapViewOnLongPressedMap(
  MapViewOnLongPressedMapRef ref, {
  required MapViewType whereViewType,
}) =>
    ref
        .watch(_mapViewDelegateProvider)
        .onLongPressedMapStream
        .stream
        .where((event) => event.viewType == whereViewType);

@riverpod
Stream<
    ({
      MapViewType viewType,
      String identifier,
    })> mapViewOnTapCircle(
  MapViewOnTapCircleRef ref, {
  required MapViewType whereViewType,
}) =>
    ref.watch(_mapViewDelegateProvider).onTapCircleStream.stream.where(
          (event) => event.viewType == whereViewType,
        );

/// MapViewのタイルが読み込まれるたびに呼ばれる
///
/// Providerだと値をキャッシュしてしまうので、RawでStreamを直接使えるようにしている
@riverpod
Raw<Stream<MapViewType>> mapViewDidFinishLoadingMap(
  MapViewDidFinishLoadingMapRef ref,
) =>
    ref.watch(_mapViewDelegateProvider).mapViewDidFinishLoadingMapStream.stream;
