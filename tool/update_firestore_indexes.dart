import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

@Task(
  'Update firestore indexes',
)
Future<void> updateFirestoreIndexes() async {
  final result = await runAsync(
    'firebase',
    arguments: [
      'firestore:databases:list',
      '--json',
    ],
  );

  final data = json.decode(result) as Map<String, dynamic>;

  final databases = (data['result'] as List)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => e['name'] as String)
      .map((e) => e.split('/').last);

  for (final e in databases) {
    final result = await runAsync(
      'firebase',
      arguments: [
        'firestore:indexes',
        '--database',
        e,
      ],
    );

    // (default) => default
    final name = e.replaceAll('(', '').replaceAll(')', '');

    File('firebase/firestore/firestore.$name.indexes.json')
        .writeAsStringSync(result);
  }
}
