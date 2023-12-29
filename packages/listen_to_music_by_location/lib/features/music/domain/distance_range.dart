enum DistanceRange {
  small,
  medium,
  large,
  ;

  double get toMeters => switch (this) {
        DistanceRange.small => 500,
        DistanceRange.medium => 1000,
        DistanceRange.large => 2000,
      };
}
