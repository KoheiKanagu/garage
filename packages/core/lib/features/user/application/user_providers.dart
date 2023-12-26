import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@riverpod
CollectionReference<User> userCollectionReference(
  UserCollectionReferenceRef ref,
) =>
    ref
        .watch(firebaseFirestoreProvider)
        .collection(CollectionPath.kUser)
        .withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: User.toFirestore,
        );

@riverpod
Stream<DocumentSnapshot<User>> userDocumentSnapshot(
  UserDocumentSnapshotRef ref,
  String uid,
) =>
    ref.watch(userCollectionReferenceProvider).doc(uid).snapshots();
