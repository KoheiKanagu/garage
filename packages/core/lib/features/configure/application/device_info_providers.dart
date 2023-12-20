import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_providers.g.dart';

@riverpod
Future<String> deviceInfoOsVersion(
  DeviceInfoOsVersionRef ref,
) {
  if (Platform.isIOS) {
    return DeviceInfoPlugin().iosInfo.then(
          (value) => '${value.systemName} ${value.systemVersion}',
        );
  }

  if (Platform.isAndroid) {
    return DeviceInfoPlugin().androidInfo.then(
          (value) => 'Android ${value.version.release}',
        );
  }

  throw UnsupportedError('Unsupported platform');
}

@riverpod
Future<String> deviceInfoModelName(
  DeviceInfoModelNameRef ref,
) {
  if (Platform.isIOS) {
    return DeviceInfoPlugin().iosInfo.then(
          (value) => value.utsname.machine,
        );
  }

  if (Platform.isAndroid) {
    return DeviceInfoPlugin().androidInfo.then(
          (value) => value.model,
        );
  }

  throw UnsupportedError('Unsupported platform');
}
