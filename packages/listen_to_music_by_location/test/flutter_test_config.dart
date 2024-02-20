import 'dart:async';

import 'package:core/utils/budoux.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/test/core.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await defaultLoadAppFonts();

  await initBudouX();
  await testMain();
}
