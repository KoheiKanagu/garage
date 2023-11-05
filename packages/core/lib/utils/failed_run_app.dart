// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void failedRunApp() {
  runApp(
    const ProviderScope(
      child: FailedRunApp(),
    ),
  );
}

class FailedRunApp extends StatelessWidget {
  const FailedRunApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '予期せぬエラーが発生しました。\nインターネットの接続をご確認の上、しばらく時間をおいてから再度お試しください。',
              ),
              const Divider(),
              const Text(
                'An unexpected error has occurred.\nPlease check your internet connection and try again after a while.',
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text(
                  'アプリを終了する\nExit the app',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
