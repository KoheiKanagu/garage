import 'package:flutter_test/flutter_test.dart';
import 'package:obento/features/hashtag/application/hashtag_search_providers.dart';

import '../../../../../core/test/test_utils.dart';

class MockHashtagSearchText extends HashtagSearchText {
  MockHashtagSearchText(this.value);

  // ignore: avoid_public_notifier_properties
  final String? value;

  @override
  String? build() {
    return value;
  }
}

void main() {
  group(
    'hashtagSearchResults',
    () {
      test(
        'should be null when search text is null',
        () async {
          final container = createContainer(
            overrides: [
              hashtagSearchTextProvider.overrideWith(
                () => MockHashtagSearchText(null),
              ),
            ],
          );

          final actual =
              await container.read(hashtagSearchResultsProvider.future);
          expect(actual, isNull);
        },
      );

      test(
        'should be null when search text is empty',
        () async {
          final container = createContainer(
            overrides: [
              hashtagSearchTextProvider.overrideWith(
                () => MockHashtagSearchText(''),
              ),
            ],
          );

          final actual =
              await container.read(hashtagSearchResultsProvider.future);
          expect(actual, isNull);
        },
      );
    },
  );
}
