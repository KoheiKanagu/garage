import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HashtagsPageBody extends HookConsumerWidget {
  const HashtagsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: const Center(
        child: Text('Home Body'),
      ),
    );
  }
}
