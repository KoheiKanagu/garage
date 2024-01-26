import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    required this.label,
    required this.onPressed,
    this.leading,
    super.key,
  });

  final String label;

  final VoidCallback? onPressed;

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: onPressed != null,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CupertinoTheme.of(context)
                    .barBackgroundColor
                    .withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CupertinoButton.filled(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) ...[
                  leading!,
                  const Gap(8),
                ],
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
