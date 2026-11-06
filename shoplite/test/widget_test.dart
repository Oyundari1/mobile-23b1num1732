// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shoplite/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShopLiteApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  testWidgets('− button decreases and never goes below 0', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShopLiteApp());

    // 0 -> 1
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // 1 -> 0
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    // 0 -> still 0
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}
