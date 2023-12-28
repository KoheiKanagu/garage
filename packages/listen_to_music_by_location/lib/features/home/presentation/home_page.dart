import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              const ConfigurePageRoute().push<void>(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Column(
        children: [
          Text('text'),
          Expanded(
            child: UiKitView(
              viewType: 'my_map_platform_view',
              creationParams: {
                'latitude': 37.42796133580664,
                'longitude': -122.085749655962,
                // 'latitude': 37.334900,
                // 'longitude': -122.009020,
              },
              creationParamsCodec: StandardMessageCodec(),
            ),
          ),
        ],
      ),
    );
  }
}
