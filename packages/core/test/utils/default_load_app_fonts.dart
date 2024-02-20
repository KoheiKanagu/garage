// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@visibleForTesting
Future<void> defaultLoadAppFonts() async {
  // build/unit_test_assets/FontManifest.json
  final fontManifest = await rootBundle.loadStructuredData(
    'FontManifest.json',
    (string) async => json.decode(string) as Iterable<dynamic>,
  );

  /// Load default fonts from root directory
  /// https://github.com/KoheiKanagu/garage/tree/main/fonts
  final defaultFonts = [
    'NotoSansJP',
  ];

  for (final e in defaultFonts) {
    final loader = FontLoader(e);

    final fonts = Directory('../../fonts/$e')
        .listSync()
        .map((e) => e.absolute.path)
        .where((e) => e.endsWith('.ttf'));

    for (final f in fonts) {
      loader.addFont(
        rootBundle.load(f),
      );
    }
    await loader.load();
  }

  for (final e in fontManifest) {
    final family = e['family'] as String;

    final FontLoader loader;

    // like "packages/cupertino_icons/CupertinoIcons"
    if (family.startsWith('packages')) {
      loader = FontLoader(family);
    } else {
      final name = Uri.parse(family).pathSegments.last;
      loader = FontLoader(name);
    }

    for (final f in e['fonts'] as List<dynamic>) {
      final asset = f['asset'] as String;
      loader.addFont(
        rootBundle.load(asset),
      );
    }
    await loader.load();
  }
}
