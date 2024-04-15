import 'package:core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upgrader/upgrader.dart';

part 'version_check_providers.g.dart';

/// 新しいバージョンがリリースされているかどうか
@riverpod
Future<bool> versionCheckIsReleasedNew(
  VersionCheckIsReleasedNewRef ref,
) async {
  final info = await ref.watch(versionCheckInfoProvider.future);

  final installed = info.installedVersion;
  final appStore = info.appStoreVersion;

  if (installed == null || appStore == null) {
    logger.warning('versionCheckIsReleasedNew: null version info');
    return false;
  }

  return appStore > installed;
}

/// 新しいバージョンにアップデートが必須であるかどうか
@riverpod
Future<bool> versionCheckIsRequiredUpdate(
  VersionCheckIsRequiredUpdateRef ref,
) async {
  final info = await ref.watch(versionCheckInfoProvider.future);

  final installed = int.tryParse(info.installedVersion?.build ?? '0');
  // info.minAppVersionはストアテキストの修正が必要になるので利用しない
  if (installed == null) {
    logger.warning('versionCheckIsRequiredUpdate: null version info');
    return false;
  }

  final min = await ref.watch(configureRequiredVersionCodeProvider.future);

  return min > installed;
}

@riverpod
Stream<UpgraderVersionInfo> versionCheckInfo(
  VersionCheckInfoRef ref,
) =>
    ref
        .watch(upgraderProvider)
        .stateStream
        .map((e) => e.versionInfo)
        .where((e) => e != null)
        .cast<UpgraderVersionInfo>();

@riverpod
Upgrader upgrader(
  UpgraderRef ref,
) {
  final instance = Upgrader.sharedInstance;

  if (kAppEnvDev) {
    final packageInfo = ref.watch(packageInfoProvider);
    instance.installPackageInfo(
      packageInfo: PackageInfo(
        appName: packageInfo.appName,
        packageName: packageInfo.packageName.replaceFirst(r'.dev$', ''),
        version: packageInfo.version,
        buildNumber: packageInfo.buildNumber,
        buildSignature: packageInfo.buildSignature,
        installerStore: packageInfo.installerStore,
      ),
    );
  }

  return instance;
}
