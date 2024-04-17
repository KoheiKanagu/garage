import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    ($) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('app')),
            backgroundColor: Colors.red,
            floatingActionButton: FloatingActionButton(
              key: const Key('my_fab'),
              onPressed: () {},
            ),
          ),
        ),
      );

      expect($('app'), findsOneWidget);

      await $(FloatingActionButton).tap();
      await $(#my_fab).tap();
    },
  );
}
