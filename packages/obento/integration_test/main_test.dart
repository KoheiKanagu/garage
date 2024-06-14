import 'package:convenient_test_dev/convenient_test_dev.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obento/main_dev.dart' as main_dev;

void main() {
  convenientTestMain(MyConvenientTestSlot(), () {
    group(
      "simple test",
      () {
        tTestWidgets(
          "example",
          (t) async {


          },
        );
      },
    );
  });
}

class MyConvenientTestSlot extends ConvenientTestSlot {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> appMain(AppMainExecuteMode mode) async => main_dev.main(
        navigatorKey: navigatorKey,
      );

  @override
  BuildContext? getNavContext(ConvenientTest t) => navigatorKey.currentContext;
}
