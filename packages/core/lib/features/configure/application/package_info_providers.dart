import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info_providers.g.dart';

@riverpod
PackageInfo packageInfo(
  PackageInfoRef _,
) =>
    throw UnimplementedError();

@riverpod
int packageInfoBuildNumber(
  PackageInfoBuildNumberRef ref,
) =>
    int.tryParse(ref.watch(packageInfoProvider).buildNumber) ?? 0;

@riverpod
String packageInfoVersion(
  PackageInfoVersionRef ref,
) =>
    ref.watch(packageInfoProvider).version;

@riverpod
String packageInfoAppName(
  PackageInfoAppNameRef ref,
) =>
    ref.watch(packageInfoProvider).appName;
