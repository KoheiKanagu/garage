import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';

class DistanceRangeSegmentedControl extends HookConsumerWidget {
  const DistanceRangeSegmentedControl({
    required this.onChanged,
    required this.initialValue,
    super.key,
  });

  final DistanceRange initialValue;

  final ValueChanged<DistanceRange> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(initialValue);

    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        children: {
          for (final e in DistanceRange.values)
            e: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                e.label,
                style: selected.value == e
                    ? CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor,
                        )
                    : CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
        },
        groupValue: selected.value,
        onValueChanged: (value) {
          HapticFeedback.heavyImpact();
          selected.value = value ?? DistanceRange.medium;
          onChanged(selected.value);
        },
        thumbColor: CupertinoTheme.of(context).primaryColor,
      ),
    );
  }
}
