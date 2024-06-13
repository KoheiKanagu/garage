import 'package:isar/isar.dart';
import 'package:obento/features/hashtag/domain/hashtag.dart';

part 'hashtag_db.g.dart';

@collection
class HashtagDb {
  HashtagDb(
    this.content,
  );

  final id = Isar.autoIncrement;

  @Index()
  final String content;

  static List<HashtagDb> fromHashtag(Hashtag hashtag) {
    return hashtag.hashtags.map(HashtagDb.new).toList();
  }
}
