import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebase.mocks.mocks.dart';
import '../../../utils/create_container.dart';

void main() {
  group('firebaseUserUid', () {
    test(
      'サインイン済みの場合はuidを取得できること',
      () async {
        final user = MockUser();
        when(user.uid).thenReturn('uid');

        final container = createContainer(
          overrides: [
            firebaseUserProvider.overrideWith(
              (ref) => Stream.value(user),
            ),
          ],
        )..listen(
            firebaseUserProvider,
            (previous, next) {},
          );

        final actual = await container.read(firebaseUserUidProvider.future);
        expect(actual, 'uid');
      },
    );

    test(
      'サインインしていない場合はnullであること',
      () async {
        final container = createContainer(
          overrides: [
            firebaseUserProvider.overrideWith(
              (ref) => Stream.value(null),
            ),
          ],
        )..listen(
            firebaseUserProvider,
            (previous, next) {},
          );

        final actual = await container.read(firebaseUserUidProvider.future);
        expect(actual, isNull);
      },
    );
  });

  group('firebaseUserIsSignedIn', () {
    test(
      'サインインしていない場合はfalseであること',
      () async {
        final container = createContainer(
          overrides: [
            firebaseUserUidProvider.overrideWith(
              (ref) => Future.value(),
            ),
          ],
        );

        final actual =
            await container.read(firebaseUserIsSignedInProvider.future);
        expect(actual, isFalse);
      },
    );

    test(
      'サインイン済みの場合はtrueであること',
      () async {
        final container = createContainer(
          overrides: [
            firebaseUserUidProvider.overrideWith(
              (ref) => Future.value('uid'),
            ),
          ],
        );

        final actual =
            await container.read(firebaseUserIsSignedInProvider.future);
        expect(actual, isTrue);
      },
    );
  });

  group('firebaseUserLinkedProviders', () {
    test(
      'サインインしていない場合はnullであること',
      () async {
        final container = createContainer(
          overrides: [
            firebaseUserProvider.overrideWith(
              (ref) => Stream.value(null),
            ),
          ],
        )..listen(
            firebaseUserProvider,
            (previous, next) {},
          );

        final actual =
            await container.read(firebaseUserLinkedProvidersProvider.future);
        expect(actual, isNull);
      },
    );

    test(
      'リンク済みのプロバイダーが取得できること',
      () async {
        final user = MockUser();
        final userInfo = MockUserInfo();
        when(user.providerData).thenReturn([userInfo]);
        when(userInfo.providerId).thenReturn('providerId');

        final container = createContainer(
          overrides: [
            firebaseUserProvider.overrideWith(
              (ref) => Stream.value(user),
            ),
          ],
        )..listen(
            firebaseUserProvider,
            (previous, next) {},
          );

        final actual =
            await container.read(firebaseUserLinkedProvidersProvider.future);
        expect(actual, containsAll(['providerId']));
      },
    );

    test(
      'リンク済みの空のプロバイダーが取得できること',
      () async {
        final user = MockUser();
        when(user.providerData).thenReturn([]);

        final container = createContainer(
          overrides: [
            firebaseUserProvider.overrideWith(
              (ref) => Stream.value(user),
            ),
          ],
        )..listen(
            firebaseUserProvider,
            (previous, next) {},
          );

        final actual =
            await container.read(firebaseUserLinkedProvidersProvider.future);

        expect(actual, isEmpty);
      },
    );
  });
}
