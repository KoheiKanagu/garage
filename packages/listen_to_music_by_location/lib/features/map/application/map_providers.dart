import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@riverpod
MyFlutterApiController myFlutterApiController(
  MyFlutterApiControllerRef ref,
) {
  final controller = MyFlutterApiController(
    myHostApi: ref.watch(myHostApiProvider),
  );
  MyFlutterApi.setup(controller);

  return controller;
}

class MyFlutterApiController implements MyFlutterApi {
  const MyFlutterApiController({
    required this.myHostApi,
  });

  final MyHostApi myHostApi;

  @override
  void onLongPressedMap(double latitude, double longitude) {
    myHostApi.addAnnotation(
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
}

@riverpod
MyHostApi myHostApi(
  MyHostApiRef ref,
) =>
    MyHostApi();
