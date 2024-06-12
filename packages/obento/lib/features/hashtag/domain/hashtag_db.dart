import 'package:isar/isar.dart';

part 'hashtag_db.g.dart';

@collection
class HashtagDb {
  HashtagDb({
    required this.value,
  });

  final id = Isar.autoIncrement;

  final String value;
}
