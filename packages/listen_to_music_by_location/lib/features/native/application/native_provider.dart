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

@riverpod
MusicKit musicKit(
  MusicKitRef ref,
) =>
    MusicKit();
