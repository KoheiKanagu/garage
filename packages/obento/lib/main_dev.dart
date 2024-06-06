import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:obento/constants/firebase_options_dev.dart';
import 'package:obento/media_query_preview.dart';
import 'package:obento/my_app.dart';
import 'package:obento/preview_device.dart';

Future<void> main() async {
  kTenantId = 'obento-44oe4';
  kAppStoreId = '6499041461';
  kBannerAdUnitId = kBannerAdUnitIdTest;

  final container = await initialize(
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  );

  if (container != null) {
    // Widget buildMyApp(Key key) {
    //   return UncontrolledProviderScope(
    //     container: container,
    //     child: MyApp(
    //       key: key,
    //     ),
    //   );
    // }

    // final view = WidgetsBinding.instance.platformDispatcher.views.first;
    // final screenSize = view.physicalSize;
    // final eachWidth = screenSize.width / 5;

    // runApp(
    //   const _MyApp(
    //     targetPlatform: TargetPlatform.iOS,
    //   ),
    // );

    // return;

    runApp(
      MediaQueryPreview(
        previewDevices: [
          PreviewDevice.iPhone5_5inch(
            textScaleFactor: 0.5,
          ),
          PreviewDevice.iPhone5_5inch(
            brightness: Brightness.dark,
          ),
          PreviewDevice.android6_7inch(),

          // PreviewDevice.iPhone5_5inch(
          //   textScaleFactor: 1.5,
          // ),
          // PreviewDevice.iPhone6_7inch(
          //   textScaleFactor: 0.5,
          // ),
          // PreviewDevice.iPhone6_7inch(),
          // PreviewDevice.iPhone6_7inch(
          //   textScaleFactor: 1.5,
          // ),
          PreviewDevice.android6_7inch(
            textScaleFactor: 0.5,
          ),
          PreviewDevice.android6_7inch(),
          PreviewDevice.android6_7inch(
            textScaleFactor: 1.5,
          ),
        ],
        builder: (context, previewDevice) {
          return _MyApp(
            targetPlatform: previewDevice.targetPlatform,
          );

          return UncontrolledProviderScope(
            container: container,
            child: MyApp(
              key: GlobalObjectKey(previewDevice),
              targetPlatform: previewDevice.targetPlatform,
            ),
          );
        },
      ),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({
    required this.targetPlatform,
    super.key,
  });

  final TargetPlatform targetPlatform;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    print('paddingOf: ${MediaQuery.paddingOf(context)}');
    print('viewPaddingOf: ${MediaQuery.viewPaddingOf(context)}');
    print('viewInsetsOf: ${MediaQuery.viewInsetsOf(context)}');

    final child = ListView(
      children: [
        Text(
          'MediaQuery: ${MediaQuery.of(context).size}',
        ),
        Text(
          'MediaQuery.padding: ${MediaQuery.paddingOf(context)}',
        ),
        Text(
          'MediaQuery.viewPadding: ${MediaQuery.viewPaddingOf(context)}',
        ),
        Text(
          'MediaQuery.viewInsetsOf: ${MediaQuery.viewInsetsOf(context)}',
        ),
        const Gap(24),
        LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              children: [
                Text(
                  'maxWidth: ${constraints.maxWidth}',
                ),
                Text(
                  'maxHeight: ${constraints.maxHeight}',
                ),
                Text(
                  'minWidth: ${constraints.minWidth}',
                ),
                Text(
                  'minHeight: ${constraints.minHeight}',
                ),
              ],
            );
          },
        ),
        const CupertinoTextField(),
        ...List.generate(
          100,
          (index) => Text(index.toString()),
        ),
      ],
    );

    return targetPlatform == TargetPlatform.iOS
        ? CupertinoApp(
            theme: const CupertinoThemeData(),
            home: CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('MediaQuery Preview'),
              ),
              child: child,
            ),
          )
        : MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              platform: targetPlatform,
            ),
            home: Scaffold(
              floatingActionButton: FloatingActionButton.large(
                onPressed: () {},
                child: const Icon(Icons.abc),
              ),
              appBar: AppBar(
                title: const Text('MediaQuery Preview'),
              ),
              body: child,
            ),
          );
  }
}
