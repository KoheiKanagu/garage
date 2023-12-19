import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:listen_to_music_by_location/i18n/strings.g.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            DateFormat.yMMMMEEEEd().format(
              DateTime.now(),
            ),
          ),
          Text(
            i18n.hello(name: 'name'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              MaterialLocalizations.of(context).closeButtonLabel,
            ),
          ),
        ],
      ),
    );
  }
}
