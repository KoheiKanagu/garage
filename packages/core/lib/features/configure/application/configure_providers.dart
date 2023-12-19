import 'package:core/core.dart';
import 'package:core/features/configure/application/remote_config_providers.dart';
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

/// Returns the URI of the feedback page.
@riverpod
Future<Uri?> configureFeedbackUri(
  ConfigureFeedbackUriRef ref,
) {
  return ref
      .watch(
        remoteConfigGetStringValueProvider(
          key: RemoteConfigConstant.kFeedbackUri,
          defaultValue: '',
        ).future,
      )
      .then(Uri.tryParse);
}
