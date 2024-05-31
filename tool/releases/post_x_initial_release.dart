import 'package:collection/collection.dart';
import 'package:grinder/grinder.dart';

import '../utils.dart';

@Task(
  'Post to X with initial release',
)
Future<void> postXInitialRelease() async {
  final packages = await argumentScopes();

  final urlSet = packages.values
      .map(
        (package) {
          if (package.hasAppStoreMetaData) {
            return package.promotionalTexts.map(
              (e) => _build(
                text: e,
                lp: package.lp,
              ),
            );
          }

          return null;
        },
      )
      .whereNotNull()
      .flattened
      .toSet();

  for (final e in urlSet) {
    run(
      'open',
      arguments: [
        e,
      ],
    );
  }
}

String _build({
  required String text,
  required Uri lp,
}) {
  return Uri(
    scheme: 'https',
    host: 'x.com',
    pathSegments: [
      'intent',
      'post',
    ],
    queryParameters: {
      'url': lp.toString(),
      'text': text,
    },
  ).toString();
}
