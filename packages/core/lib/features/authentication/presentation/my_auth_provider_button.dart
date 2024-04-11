// ignore_for_file: depend_on_referenced_packages

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core/core.dart';
import 'package:core/gen/strings.g.dart';
import 'package:flutter/material.dart';
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
    final authProvider = ref.watch(myAuthProvider(type));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: type.logoBackgroundColorOf(context),
      ),
      height: _logoSize,
      width: double.infinity,
      child: ref.watch(myAuthIsLinkedProvider(authProvider)).maybeWhen(
            orElse: () => CircularProgressIndicator(
              backgroundColor: type.textColorOf(context),
            ),
            data: (isLinked) => GestureDetector(
              onTap: () async {
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
                    await ref.watch(
                      myAuthUnlinkProvider(authProvider).future,
                    );
                  }
                } else {
                  await ref.watch(
                    myAuthSignInOrLinkProvider(authProvider).future,
                  );
                }
              },
              child: Row(
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: type.textColorOf(context),
                        ),
                    textScaler: TextScaler.noScaling,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
