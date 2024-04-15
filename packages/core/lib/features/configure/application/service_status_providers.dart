import 'package:core/constants/collection_path.dart';
import 'package:core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_status_providers.g.dart';

/// サービスの稼働状況
@riverpod
Stream<ServiceStatus> serviceStatus(
  ServiceStatusRef ref,
) =>
    ref
        .watch(firebaseFirestoreDefaultProvider)
        .collection(CollectionPath.kServiceStatus)
        .withConverter(
          fromFirestore: ServiceStatus.fromFirestore,
          toFirestore: ServiceStatus.toFirestore,
        )
        .doc(kDatabaseId)
        .snapshots()
        .map(
          (e) => e.data() ?? const ServiceStatus(),
        );
