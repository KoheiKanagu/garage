import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_providers.g.dart';

@riverpod
Future<void> mapOnLongPressed(
  MapOnLongPressedRef ref, {
  required double latitude,
  required double longitude,
}) async {}

@riverpod
Future<void> mapOnTapCircle(
  MapOnTapCircleRef ref, {
  required String identifier,
}) async {}
