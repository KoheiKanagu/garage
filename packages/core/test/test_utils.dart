import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patrol/patrol.dart';

export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}

void patrol(
  String description,
  Future<void> Function(PatrolIntegrationTester) callback,
) =>
    patrolTest(
      description,
      nativeAutomatorConfig: const NativeAutomatorConfig(
        findTimeout: Duration(seconds: 20),
      ),
      callback,
    );
