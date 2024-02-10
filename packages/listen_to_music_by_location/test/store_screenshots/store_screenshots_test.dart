import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'example',
    () {
      expect(2 + 3, 5);
    },
  );
  // goldenTestCombo(
  //   testName: 'screenshot_1',
  //   widget: const LocamusicDetailPage(
  //     documentId: 'documentId',
  //   ),
  //   supportedLocales: AppLocaleUtils.supportedLocales,
  //   localizationsDelegates: MyApp.localizationsDelegates,
  //   cupertinoThemeData: MyApp.theme,
  //   materialThemeData: null,
  //   providerOverrides: [
  //     locamusicDocumentProvider('documentId').overrideWith(
  //       (provider) => Stream.value(
  //         Locamusic(
  //           geoPoint: const GeoPoint(0, 0),
  //           distance: DistanceRange.medium.meters,
  //           createdBy: 'createdBy',
  //         ),
  //       ),
  //     ),
  //   ],
  //   textScaleFactors: [1.0],
  //   devices: [
  //     TestDeviceSize.iPhone_6_7inch,
  //   ],
  // );
}
