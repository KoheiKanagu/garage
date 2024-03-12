import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAppPage extends HookConsumerWidget {
  const UpdateAppPage({
    required this.force,
    super.key,
  });

  final bool force;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    return switch (themeType) {
      InheritedThemeType.material => MaterialApp(
          supportedLocales: AppLocaleUtils.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: UpdateAppPageHome(
            force: force,
          ),
        ),
      InheritedThemeType.cupertino => CupertinoApp(
          supportedLocales: AppLocaleUtils.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: UpdateAppPageHome(
            force: force,
          ),
        ),
    };
  }
}

class UpdateAppPageHome extends HookConsumerWidget {
  const UpdateAppPageHome({
    required this.force,
    @visibleForTesting this.noAppIconImage = false,
    super.key,
  });

  final bool force;

  @visibleForTesting
  final bool noAppIconImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    final titleTextStyle = switch (themeType) {
      InheritedThemeType.material =>
        Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      InheritedThemeType.cupertino =>
        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
    };

    void onPressed() {
      final uri = storeUri(
        packageName: ref.watch(packageInfoPackageNameProvider),
      );
      if (uri != null) {
        launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    }

    final button = switch (themeType) {
      InheritedThemeType.material => ElevatedButton(
          onPressed: onPressed,
          child: Text(i18n.update_app.update),
        ),
      InheritedThemeType.cupertino => CupertinoButton.filled(
          onPressed: onPressed,
          child: Text(i18n.update_app.update),
        ),
    };

    final skipButton = switch (themeType) {
      InheritedThemeType.material => ElevatedButton(
          onPressed: () {
            skipUpdateApp = true;
            GoRouter.of(context).go(initialLocation);
          },
          child: Text(i18n.update_app.skip),
        ),
      InheritedThemeType.cupertino => CupertinoButton(
          onPressed: () {
            skipUpdateApp = true;
            GoRouter.of(context).go(initialLocation);
          },
          child: Text(
            i18n.update_app.skip,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: CupertinoColors.systemGrey,
                  fontSize: 16,
                ),
          ),
        ),
    };

    final body = Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: noAppIconImage
                  ? Container(
                      width: 84,
                      height: 84,
                      color: Colors.green,
                    )
                  : Image.asset(
                      'assets/images/app_icon.webp',
                      width: 84,
                      height: 84,
                    ),
            ),
          ),
          Text(
            ref.watch(packageInfoAppNameProvider),
            style: titleTextStyle,
          ),
          Text(
            i18n.update_app.title,
            style: titleTextStyle,
          ),
          const Gap(8),
          i18n.update_app
              .description(
                storeName: ref.watch(packageInfoInstallerStoreProvider) ?? '',
              )
              .wrapBudouXText(
                textAlign: TextAlign.center,
              ),
          const Gap(24),
          button,
          const Spacer(),
          Visibility(
            visible: !force,
            child: skipButton,
          ),
        ],
      ),
    );

    return switch (themeType) {
      InheritedThemeType.material => Scaffold(
          body: body,
        ),
      InheritedThemeType.cupertino => CupertinoPageScaffold(
          child: body,
        ),
    };
  }
}
