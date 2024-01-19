import 'package:listen_to_music_by_location/gen/strings.g.dart';

enum DistanceRange {
  small,
  medium,
  large,
  ;

  double get meters => switch (this) {
        DistanceRange.small => 500,
        DistanceRange.medium => 1000,
        DistanceRange.large => 2000,
      };

  String get label => switch (this) {
        DistanceRange.small => i18n.locamusic.small,
        DistanceRange.medium => i18n.locamusic.medium,
        DistanceRange.large => i18n.locamusic.large,
      };
}
