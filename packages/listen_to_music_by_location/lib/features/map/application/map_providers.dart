import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@riverpod
MyFlutterApiController myFlutterApiController(
  MyFlutterApiControllerRef ref,
) {
  final controller = MyFlutterApiController(
    myMapHostApi: ref.watch(myMapHostApiProvider),
  );
  MyFlutterApi.setup(controller);

  return controller;
}

class MyFlutterApiController implements MyFlutterApi {
  const MyFlutterApiController({
    required this.myMapHostApi,
  });

  final MyMapHostApi myMapHostApi;

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
    // TODO: implement didChangeAuthorization
  }

  @override
  void didDetermineState(Region region, RegionState state) {
    // TODO: implement didDetermineState
  }
}

@riverpod
MyMapHostApi myMapHostApi(
  MyMapHostApiRef ref,
) =>
    MyMapHostApi();
