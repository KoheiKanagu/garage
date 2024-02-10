// ignore_for_file: lines_longer_than_80_chars

class LocamusicCreationLimitException implements Exception {
  @override
  String toString() {
    return 'You have reached the limit of the number of locamusic you can create.';
  }
}
