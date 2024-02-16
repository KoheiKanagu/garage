import 'dart:async';

import 'package:core/utils/budoux.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await initBudouX();
  await testMain();
}
