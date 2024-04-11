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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(myAuthProvider(type));

    return ref.watch(myAuthIsLinkedProvider(authProvider)).maybeWhen(
          orElse: CircularProgressIndicator.adaptive,
          data: (isLinked) {
            return GestureDetector(
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: type.logoBackgroundColorOf(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
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
            );
          },
        );
  }
}
