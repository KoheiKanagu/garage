import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

class PermissionTileBase extends StatelessWidget {
  const PermissionTileBase({
    required this.headerLabel,
    required this.footerLabel,
    required this.children,
    super.key,
  });

  final String headerLabel;

  final String footerLabel;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: Text(
        headerLabel,
      ),
      footer: footerLabel.wrapBudouXText(
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 13,
            ),
      ),
      children: children,
    );
  }
}
