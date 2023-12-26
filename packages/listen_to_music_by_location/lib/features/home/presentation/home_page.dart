import 'package:core/core.dart';
import 'package:flutter/material.dart';
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
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(firebaseSignInProvider.future);
            },
            child: const Text('同意してはじめる'),
          ),
          const LinkProviderButtons(),
        ],
      ),
    );
  }
}
