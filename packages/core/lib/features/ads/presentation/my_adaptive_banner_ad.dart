import 'package:core/features/ads/application/ads_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyAdaptiveBannerAd extends HookConsumerWidget {
  const MyAdaptiveBannerAd({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerAd = ref.watch(
      adsBannerProvider(
        key: GlobalObjectKey(context),
        adUnitId: kBannerAdUnitId,
        width: MediaQuery.of(context).size.width.truncate(),
      ),
    );

    return bannerAd.maybeWhen(
      orElse: SizedBox.shrink,
      data: (data) => SizedBox(
        height: data.size.height.toDouble(),
        width: data.size.width.toDouble(),
        child: AdWidget(
          key: GlobalObjectKey(data),
          ad: data,
        ),
      ),
    );
  }
}
