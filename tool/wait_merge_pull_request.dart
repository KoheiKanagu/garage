import 'dart:async';
import 'dart:convert';

import 'package:grinder/grinder.dart';

@Task(
  'Wait for the pull request to be merged',
)
Future<void> waitMergePullRequest() async {
  final completer = Completer<void>();

  Timer.periodic(
    const Duration(seconds: 30),
    (timer) {
      final result = run(
        'gh',
        arguments: [
          'pr',
          'view',
          '--json',
          'mergedAt',
        ],
      );

      final data = json.decode(result) as Map<String, dynamic>;
      final mergedAt = data['mergedAt'] as String?;
      if (mergedAt != null) {
        timer.cancel();
        completer.complete();
      }
    },
  );

  await completer.future;
}
