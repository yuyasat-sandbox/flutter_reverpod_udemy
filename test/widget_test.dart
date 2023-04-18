// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_reverpod_udemy/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNWidgets(1));
    expect(find.text('1'), findsNWidgets(2));

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    expect(find.text('0'), findsNWidgets(1));
    expect(find.text('1'), findsNWidgets(2));

    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('-1'), findsNWidgets(1));
    expect(find.text('1'), findsNWidgets(1));
    expect(find.text('2'), findsNWidgets(1));
  });
}
