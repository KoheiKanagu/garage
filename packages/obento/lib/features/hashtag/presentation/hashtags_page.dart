import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart' as core_i18n;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/features/hashtag/application/hashtag_providers.dart';
import 'package:obento/features/hashtag/presentation/hashtags_page_body.dart';
import 'package:obento/features/preview/application/preview_route.dart';
import 'package:obento/gen/strings.g.dart';

class HashtagsPage extends HookConsumerWidget {
  const HashtagsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = ref.watch(hashtagsEditControllerProvider) != null;

    return Scaffold(
      body: const HashtagsPageBody(),
      floatingActionButton: Visibility(
        visible: !isEditMode,
        child: const _FloatingActionButton(),
      ),
      bottomNavigationBar: const SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdsRequestConsentButton(),
            MyAdaptiveBannerAd(),
          ],
        ),
      ),
      extendBody: true,
    );
  }
}

class _FloatingActionButton extends HookConsumerWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);
    return switch (themeType) {
      InheritedThemeType.material => FloatingActionButton.extended(
          heroTag: 'preview_button_${context.hashCode}',
          onPressed: () => const PreviewPageRoute().push<void>(context),
          label: Text(i18n.preview),
        ),
      InheritedThemeType.cupertino => CupertinoButton.filled(
          padding: const EdgeInsets.all(16),
          onPressed: () => const PreviewPageRoute().push<void>(context),
          child: Text(
            i18n.preview,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const CupertinoDynamicColor.withBrightness(
                    color: CupertinoColors.white,
                    darkColor: CupertinoColors.black,
                  ).resolveFrom(context),
                ),
          ),
        ),
    };
  }
}

class AdsRequestConsentButton extends HookConsumerWidget {
  const AdsRequestConsentButton({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    void onPressed() {
      ref
          .watch(
            adsRequestConsentInfoUpdateControllerProvider.notifier,
          )
          .loadForm();
    }

    return Visibility(
      visible: ref.watch(adsRequestConsentInfoUpdateControllerProvider),
      child: Column(
        children: [
          switch (themeType) {
            InheritedThemeType.cupertino => CupertinoButton.filled(
                onPressed: onPressed,
                child: Text(
                  core_i18n.i18n.ads.please_check_banner,
                ),
              ),
            InheritedThemeType.material => FloatingActionButton.extended(
                heroTag: 'ads_request_consent_button_${context.hashCode}',
                elevation: 0,
                onPressed: onPressed,
                label: Text(
                  core_i18n.i18n.ads.please_check_banner,
                ),
              ),
          },
          const Gap(12),
        ],
      ),
    );
  }
}
