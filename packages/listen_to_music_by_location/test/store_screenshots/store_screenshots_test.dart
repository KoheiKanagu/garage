import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/features/music/presentation/locamusic_detail_page.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:listen_to_music_by_location/my_app.dart';

import '../../../core/test/core.dart';

void main() {
  goldenTestCombo(
    testName: 'screenshot_1',
    widget: const LocamusicDetailPage(
      documentId: 'documentId',
    ),
    supportedLocales: AppLocaleUtils.supportedLocales,
    localizationsDelegates: MyApp.localizationsDelegates,
    cupertinoThemeData: MyApp.theme,
    materialThemeData: null,
    providerOverrides: [
      locamusicDocumentProvider('documentId').overrideWith(
        (provider) => Stream.value(
          Locamusic(
            geoPoint: const GeoPoint(0, 0),
            distance: DistanceRange.medium.meters,
            createdBy: 'createdBy',
          ),
        ),
      ),
    ],
    textScaleFactors: [1.0],
    devices: [
      TestDeviceSize.iPhone11ProMax,
    ],
  );
}
