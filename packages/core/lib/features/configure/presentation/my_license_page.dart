import 'package:core/features/configure/application/package_info_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyLicensePage extends HookConsumerWidget {
  const MyLicensePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LicensePage(
      applicationName: ref.read(packageInfoAppNameProvider),
      applicationLegalese: '©️ 2023 kingu.dev',
      applicationVersion: ref.read(packageInfoVersionProvider),
      applicationIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: Image.asset(
            'assets/images/app_icon.webp',
            width: 114,
            height: 114,
          ),
        ),
      ),
    );
  }
}
