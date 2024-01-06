// Copyright 2024 kingu.dev. All rights reserved.
// Autogenerated from Pigeon (v15.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum RegionState {
  unknown,
  inside,
  outside,
}

enum AuthorizationStatus {
  notDetermined,
  restricted,
  denied,
  authorizedAlways,
  authorizedWhenInUse,
}

class SongDetails {
  SongDetails({
    required this.id,
    required this.title,
    required this.artistName,
    this.artworkUrl,
    this.songUrl,
  });

  String id;

  String title;

  String artistName;

  String? artworkUrl;

  String? songUrl;

  Object encode() {
    return <Object?>[
      id,
      title,
      artistName,
      artworkUrl,
      songUrl,
    ];
  }

  static SongDetails decode(Object result) {
    result as List<Object?>;
    return SongDetails(
      id: result[0]! as String,
      title: result[1]! as String,
      artistName: result[2]! as String,
      artworkUrl: result[3] as String?,
      songUrl: result[4] as String?,
    );
  }
}

/// https://developer.apple.com/documentation/corelocation/clcircularregion
class Region {
  Region({
    required this.identifier,
    required this.latitude,
    required this.longitude,
    required this.radius,
  });

  String identifier;

  double latitude;

  double longitude;

  /// meters
  double radius;

  Object encode() {
    return <Object?>[
      identifier,
      latitude,
      longitude,
      radius,
    ];
  }

  static Region decode(Object result) {
    result as List<Object?>;
    return Region(
      identifier: result[0]! as String,
      latitude: result[1]! as double,
      longitude: result[2]! as double,
      radius: result[3]! as double,
    );
  }
}

class MyMapHostApi {
  /// Constructor for [MyMapHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MyMapHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = StandardMessageCodec();

  Future<void> setMapRegion({required double latitude, required double longitude, required double meters,}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMapHostApi.setMapRegion';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[latitude, longitude, meters]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> addAnnotation({required String identifier, required double latitude, required double longitude, required String title, required double circleDistance,}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMapHostApi.addAnnotation';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[identifier, latitude, longitude, title, circleDistance]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> removeAnnotation({required String identifier}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMapHostApi.removeAnnotation';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[identifier]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}

class _MyMusicHostApiCodec extends StandardMessageCodec {
  const _MyMusicHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SongDetails) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return SongDetails.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class MyMusicHostApi {
  /// Constructor for [MyMusicHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MyMusicHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _MyMusicHostApiCodec();

  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  Future<String> requestPermission() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMusicHostApi.requestPermission';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as String?)!;
    }
  }

  /// Status
  /// https://developer.apple.com/documentation/musickit/musicauthorization/status
  Future<String> currentPermissionStatus() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMusicHostApi.currentPermissionStatus';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as String?)!;
    }
  }

  Future<void> play({required String id}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMusicHostApi.play';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<SongDetails> songDetails({required String id, int artworkSize = 512}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyMusicHostApi.songDetails';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[id, artworkSize]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as SongDetails?)!;
    }
  }
}

class _MyLocationHostApiCodec extends StandardMessageCodec {
  const _MyLocationHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Region) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is Region) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return Region.decode(readValue(buffer)!);
      case 129: 
        return Region.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class MyLocationHostApi {
  /// Constructor for [MyLocationHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MyLocationHostApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _MyLocationHostApiCodec();

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1620562-requestwheninuseauthorization
  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1620551-requestalwaysauthorization
  Future<void> requestAuthorization({required bool always}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyLocationHostApi.requestAuthorization';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[always]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Status
  /// https://developer.apple.com/documentation/corelocation/clauthorizationstatus
  Future<AuthorizationStatus> currentPermissionStatus() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyLocationHostApi.currentPermissionStatus';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return AuthorizationStatus.values[__pigeon_replyList[0]! as int];
    }
  }

  /// CLRegion.identifier
  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423790-monitoredregions
  Future<List<Region?>> monitoredRegions() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyLocationHostApi.monitoredRegions';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as List<Object?>?)!.cast<Region?>();
    }
  }

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423656-startmonitoring
  Future<void> startMonitoring({required Region region}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyLocationHostApi.startMonitoring';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[region]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// https://developer.apple.com/documentation/corelocation/cllocationmanager/1423840-stopmonitoring
  Future<void> stopMonitoring({required Region region}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.listen_to_music_by_location.MyLocationHostApi.stopMonitoring';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[region]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}

class _MyFlutterApiCodec extends StandardMessageCodec {
  const _MyFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Region) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return Region.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class MyFlutterApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _MyFlutterApiCodec();

  /// on tap MKCircle
  void onTapCircle(String identifier);

  /// on long pressed MKMapView
  void onLongPressedMap(double latitude, double longitude);

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423570-locationmanager
  void didDetermineState(Region region, RegionState state);

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/3563956-locationmanagerdidchangeauthoriz
  void didChangeAuthorization(AuthorizationStatus status);

  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423842-locationmanager
  /// https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423720-locationmanager
  void didStartMonitoring(Region region, String? error);

  static void setup(MyFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onTapCircle', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onTapCircle was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_identifier = (args[0] as String?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onTapCircle was null, expected non-null String.');
          try {
            api.onTapCircle(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onLongPressedMap', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onLongPressedMap was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final double? arg_latitude = (args[0] as double?);
          assert(arg_latitude != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onLongPressedMap was null, expected non-null double.');
          final double? arg_longitude = (args[1] as double?);
          assert(arg_longitude != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.onLongPressedMap was null, expected non-null double.');
          try {
            api.onLongPressedMap(arg_latitude!, arg_longitude!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didDetermineState', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didDetermineState was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final Region? arg_region = (args[0] as Region?);
          assert(arg_region != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didDetermineState was null, expected non-null Region.');
          final RegionState? arg_state = args[1] == null ? null : RegionState.values[args[1]! as int];
          assert(arg_state != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didDetermineState was null, expected non-null RegionState.');
          try {
            api.didDetermineState(arg_region!, arg_state!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didChangeAuthorization', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didChangeAuthorization was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AuthorizationStatus? arg_status = args[0] == null ? null : AuthorizationStatus.values[args[0]! as int];
          assert(arg_status != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didChangeAuthorization was null, expected non-null AuthorizationStatus.');
          try {
            api.didChangeAuthorization(arg_status!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didStartMonitoring', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didStartMonitoring was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final Region? arg_region = (args[0] as Region?);
          assert(arg_region != null,
              'Argument for dev.flutter.pigeon.listen_to_music_by_location.MyFlutterApi.didStartMonitoring was null, expected non-null Region.');
          final String? arg_error = (args[1] as String?);
          try {
            api.didStartMonitoring(arg_region!, arg_error);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
