import 'dart:async';

import 'package:core/utils/budoux.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await defaultLoadAppFonts();
  initializeLocalFileComparatorWithThreshold();

  await initBudouX();
  await testMain();
}
