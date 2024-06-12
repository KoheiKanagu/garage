import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_query_preview/media_query_preview.dart';
import 'package:obento/constants/firebase_options_dev.dart';
import 'package:obento/my_app.dart';

Future<void> main() async {
  kTenantId = 'obento-44oe4';
  kAppStoreId = '6499041461';
  kBannerAdUnitId = kBannerAdUnitIdTest;

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  if (container == null) {
    throw Exception('Failed to initialize');
  }

  Widget buildApp(TargetPlatform targetPlatform) {
    return UncontrolledProviderScope(
      container: container,
      child: MyApp(
        targetPlatform: targetPlatform,
      ),
    );
  }

  if (kReleaseMode) {
    // ignore: missing_provider_scope
    runApp(
      buildApp(
        Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android,
      ),
    );
    return;
  }

  // ignore: missing_provider_scope
  runApp(
    MediaQueryPreview(
      previewDevices: [
        [
          PreviewDevice.iPhone5_5inch(
            textScaleFactor: 0.5,
          ),
          PreviewDevice.iPhone5_5inch(),
          PreviewDevice.iPhone5_5inch(
            brightness: Brightness.dark,
          ),
          PreviewDevice.iPhone5_5inch(
            textScaleFactor: 1.5,
          ),
        ],
        [
          PreviewDevice.iPhone6_7inch(
            textScaleFactor: 0.5,
          ),
          PreviewDevice.iPhone6_7inch(),
          PreviewDevice.iPhone6_7inch(
            textScaleFactor: 1.5,
          ),
        ],
        [
          PreviewDevice.android6_7inch(
            textScaleFactor: 0.5,
          ),
          PreviewDevice.android6_7inch(),
          PreviewDevice.android6_7inch(
            textScaleFactor: 1.5,
          ),
        ]
      ],
      builder: (_, previewDevice) {
        return buildApp(
          previewDevice.targetPlatform,
        );
      },
    ),
  );
}
