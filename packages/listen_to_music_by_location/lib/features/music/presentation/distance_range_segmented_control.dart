import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';

class DistanceRangeSegmentedControl extends HookConsumerWidget {
  const DistanceRangeSegmentedControl({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<DistanceRange> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(DistanceRange.medium);

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
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: selected.value == e
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
        },
        groupValue: selected.value,
        onValueChanged: (value) {
          selected.value = value ?? DistanceRange.medium;
          onChanged(selected.value);
        },
        thumbColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
    );
  }
}
