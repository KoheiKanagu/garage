import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:listen_to_music_by_location/constants/firebase_options_dev.dart';
import 'package:listen_to_music_by_location/features/music/application/locamusic_providers.dart';
import 'package:listen_to_music_by_location/features/music/domain/distance_range.dart';
import 'package:listen_to_music_by_location/features/music/domain/locamusic.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:listen_to_music_by_location/gen/strings.g.dart';
import 'package:listen_to_music_by_location/my_app.dart';

Future<void> main() async {
  kTenantId = 'loca-music-l7m49';
  kAppStoreId = '6471416156';

  // i18nのlocaleの初期化は[initialize()]だが、待てないのでここで初期化
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  const artworkUrl =
      'https://raw.githubusercontent.com/KoheiKanagu/garage/main/packages/listen_to_music_by_location/assets/images/app_icon.webp';

  final mockLocamusics = [
    (
      documentId: 'document1',
      locamusic: Locamusic(
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        geoPoint: const GeoPoint(35.68099, 139.76720), // Tokyo Station
        distance: DistanceRange.small.meters,
        createdBy: 'createdBy',
        musicId: 'music1',
      ),
      songDetails: SongDetails(
        id: 'music1',
        title: i18n.app_name,
        artistName: 'Kanagu Kohei',
        artworkUrl: artworkUrl,
        songUrl: '',
      ),
    ),
    (
      documentId: 'document2',
      locamusic: Locamusic(
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        geoPoint: const GeoPoint(35.62984, 139.79401), // Tokyo Big Sight
        distance: DistanceRange.large.meters,
        createdBy: 'createdBy',
        musicId: 'music2',
      ),
      songDetails: SongDetails(
        id: 'music2',
        title: i18n.app_name,
        artistName: 'Kanagu Kohei',
        artworkUrl: artworkUrl,
        songUrl: '',
      ),
    ),
    (
      documentId: 'document3',
      locamusic: Locamusic(
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        geoPoint: const GeoPoint(35.62922, 139.74009), // Shinagawa Station
        distance: DistanceRange.medium.meters,
        createdBy: 'createdBy',
        musicId: 'music3',
      ),
      songDetails: SongDetails(
        id: 'music3',
        title: i18n.app_name,
        artistName: 'Kanagu Kohei',
        artworkUrl: artworkUrl,
        songUrl: '',
      ),
    ),
    (
      documentId: 'document4',
      locamusic: Locamusic(
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        geoPoint: const GeoPoint(35.65857, 139.70145), // Shibuya Station
        distance: DistanceRange.medium.meters,
        createdBy: 'createdBy',
        musicId: 'music4',
      ),
      songDetails: SongDetails(
        id: 'music4',
        title: i18n.unset,
        artistName: 'Kanagu Kohei',
        artworkUrl: artworkUrl,
        songUrl: '',
      ),
    ),
    (
      documentId: 'document5',
      locamusic: Locamusic(
        createdAt: Timestamp.fromDate(DateTime.now()),
        updatedAt: Timestamp.fromDate(DateTime.now()),
        geoPoint: const GeoPoint(35.70550, 139.7517), // Tokyo Dome
        distance: DistanceRange.medium.meters,
        createdBy: 'createdBy',
        musicId: 'music5',
      ),
      songDetails: SongDetails(
        id: 'music5',
        title: i18n.unset,
        artistName: 'Kanagu Kohei',
        artworkUrl: artworkUrl,
        songUrl: '',
      ),
    ),
  ];

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    overrides: [
      locamusicDocumentsProvider.overrideWith(
        (_) => Stream.value(
          mockLocamusics
              .map(
                (e) => (
                  documentId: e.documentId,
                  locamusic: e.locamusic,
                ),
              )
              .toList(),
        ),
      ),
      ...mockLocamusics.map(
        (e) => locamusicDocumentProvider(e.documentId).overrideWith(
          (_) => Stream.value(e.locamusic),
        ),
      ),
      ...mockLocamusics.map(
        (e) => locamusicSongDetailsProvider(e.locamusic.musicId ?? '')
            .overrideWith(
          (_) => e.songDetails,
        ),
      ),
    ],
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
  );

  if (container != null) {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  }
}
