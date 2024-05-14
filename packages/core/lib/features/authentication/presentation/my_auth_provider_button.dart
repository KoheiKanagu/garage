// ignore_for_file: depend_on_referenced_packages

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jovial_svg/jovial_svg.dart';

class MyAuthProviderButton extends HookConsumerWidget {
  const MyAuthProviderButton({
    required this.type,
    super.key,
  });

  final MyAuthProviderType type;

  static const double _logoSize = 44;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeType = InheritedThemeDetector.of(context);

    final authProviderController = ref.watch(
      myAuthProviderControllerProvider(type).notifier,
    );

    final isProgress = useState(false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: type.logoBackgroundColorOf(context),
      ),
      height: _logoSize,
      width: double.infinity,
      child: ref.watch(myAuthProviderIsLinkedProvider(type)).maybeWhen(
            orElse: () => Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: type.textColorOf(context),
              ),
            ),
            data: (isLinked) => GestureDetector(
              onTap: () async {
                if (isProgress.value) {
                  return;
                }
                final indicator = showMyProgressIndicator(
                  builder: (context) => const SizedBox.shrink(),
                );

                try {
                  isProgress.value = true;

                  if (isLinked) {
                    final result = await showOkCancelAlertDialog(
                      context: context,
                      title: i18n.auth.unlink_confirm(
                        account: type.providerName,
                      ),
                      isDestructiveAction: true,
                      okLabel: i18n.auth.unlink,
                    );

                    if (result == OkCancelResult.ok) {
                      await authProviderController.unlink();
                    }
                  } else {
                    await authProviderController.signInOrLink();
                  }
                } on Exception catch (e, stack) {
                  logger.handle(e, stack);

                  if (context.mounted) {
                    await showOkAlertDialog(
                      context: context,
                      title: i18n.auth.exception,
                      message: i18n.auth.exception_message,
                    );
                  }
                } finally {
                  isProgress.value = false;
                  indicator.dismiss();
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isProgress.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: _logoSize,
                            height: _logoSize,
                            padding: type.logoPadding,
                            child: ScalableImageWidget.fromSISource(
                              si: ScalableImageSource.fromSI(
                                DefaultAssetBundle.of(context),
                                type.logoAssetPathOf(context),
                              ),
                            ),
                          ),
                          Text(
                            isLinked ? type.unlinkLabel : type.signInLabel,
                            style: switch (themeType) {
                              InheritedThemeType.material => Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: type.textColorOf(context),
                                  ),
                              InheritedThemeType.cupertino =>
                                CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .copyWith(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: type.textColorOf(context),
                                    ),
                            },
                            textScaler: TextScaler.noScaling,
                          ),
                        ],
                      ),
              ),
            ),
          ),
    );
  }
}
