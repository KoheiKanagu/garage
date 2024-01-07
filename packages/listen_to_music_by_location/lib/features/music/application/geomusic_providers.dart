import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/features/firebase/application/firebase_providers.dart';
import 'package:listen_to_music_by_location/constants/collection_path.dart';
import 'package:listen_to_music_by_location/features/music/domain/geomusic.dart';
import 'package:listen_to_music_by_location/gen/message.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geomusic_providers.g.dart';

@riverpod
CollectionReference<Geomusic> geomusicCollectionReference(
  GeomusicCollectionReferenceRef ref,
) =>
    ref
        .read(firebaseFirestoreProvider)
        .collection(CollectionPath.kGeomusics)
        .withConverter(
          fromFirestore: Geomusic.fromFirestore,
          toFirestore: Geomusic.toFirestore,
        );
