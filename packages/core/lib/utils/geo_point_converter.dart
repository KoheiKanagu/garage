import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointConverter extends JsonConverter<GeoPoint, dynamic> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(dynamic json) {
    if (json is GeoPoint) {
      return json;
    }

    throw Exception();
  }

  @override
  GeoPoint? toJson(GeoPoint? object) {
    return object;
  }
}
