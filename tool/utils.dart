import 'dart:convert';
import 'dart:io';

import 'package:grinder/grinder.dart';

Future<List<Directory>> runMelosList() async {
  final result = await runAsync(
    'melos',
    arguments: [
      'list',
      '--json',
    ],
  );
  return (json.decode(result) as List)
      .map((e) => e as Map<String, dynamic>)
      .map((e) => e['location'] as String)
      .map(Directory.new)
      .toList();
}
