import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'configure_providers.g.dart';

@riverpod
Future<bool> configureIsReleasedNewVersion(
  ConfigureIsReleasedNewVersionRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kLatestVersionCode,
      defaultValue: RemoteConfigConstant.kLatestVersionCodeValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

@riverpod
Future<bool> configureIsNeedUpdate(
  ConfigureIsNeedUpdateRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetIntValueProvider(
      key: RemoteConfigConstant.kRequirementVersionCode,
      defaultValue: RemoteConfigConstant.kRequirementVersionCodeValue,
    ).future,
  );

  return value > ref.watch(packageInfoBuildNumberProvider);
}

@riverpod
Future<ServiceStatus> configureServiceStatus(
  ConfigureServiceStatusRef ref,
) async {
  final value = await ref.watch(
    remoteConfigGetStringValueProvider(
      key: RemoteConfigConstant.kServiceStatus,
      defaultValue: '',
    ).future,
  );

  return switch (value) {
    'up' => ServiceStatus.up,
    'down' => ServiceStatus.down,
    _ => ServiceStatus.down,
  };
}

@riverpod
Future<Uri?> configureTermsOfServiceUri(
  ConfigureTermsOfServiceUriRef ref,
) {
  return ref
      .watch(
        remoteConfigGetStringValueProvider(
          key: RemoteConfigConstant.kTermsOfServiceUri,
          defaultValue: '',
        ).future,
      )
      .then(Uri.tryParse);
}

@riverpod
Future<Uri?> configurePrivacyPolicyUri(
  ConfigurePrivacyPolicyUriRef ref,
) {
  return ref
      .watch(
        remoteConfigGetStringValueProvider(
          key: RemoteConfigConstant.kPrivacyPolicyUri,
          defaultValue: '',
        ).future,
      )
      .then(Uri.tryParse);
}
