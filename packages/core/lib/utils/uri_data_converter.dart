import 'package:json_annotation/json_annotation.dart';

class UriDataConverter extends JsonConverter<UriData, String> {
  const UriDataConverter();

  @override
  UriData fromJson(String json) {
    return UriData.parse(json);
  }

  @override
  String toJson(UriData object) {
    return object.toString();
  }
}
