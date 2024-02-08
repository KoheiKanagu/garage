import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_providers.g.dart';

@riverpod
AnalyticsController analyticsController(
  AnalyticsControllerRef ref,
) =>
    AnalyticsController(
      analytics: ref.watch(firebaseAnalyticsProvider),
    );

class AnalyticsController {
  AnalyticsController({
    required this.analytics,
  });

  final FirebaseAnalytics analytics;

  /// 曲を再生したイベント
  Future<void> logPlayMusic({
    required bool builtInSpeaker,
  }) =>
      analytics.logEvent(
        name: 'play_music',
        parameters: {
          'built_in_speaker': builtInSpeaker.toString(),
        },
      );
}
