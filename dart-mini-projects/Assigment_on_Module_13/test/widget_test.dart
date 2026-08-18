import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assigment_on_module_13/main.dart';

void main() {
  testWidgets('counter increases and the value is passed to Details Screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // The Home tab is shown by default with counter value 0.
    expect(find.text('Counter Value'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Increase the counter 3 times using setState().
    for (var i = 1; i <= 3; i++) {
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
      expect(find.text('$i'), findsOneWidget);
    }

    // Reset back to 0.
    await tester.tap(find.byKey(const Key('reset_button')));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    // Increase twice again, then open the Details Screen.
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();
    }
    await tester.tap(find.byKey(const Key('view_details_button')));
    await tester.pumpAndSettle();

    // Details Screen shows the passed counter value.
    expect(find.text('Details Screen'), findsOneWidget);
    expect(find.text('Counter value passed from Home Screen:'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);

    // Navigator.pop() returns to the Home Screen.
    await tester.tap(find.byKey(const Key('go_back_button')));
    await tester.pumpAndSettle();
    expect(find.text('Counter Value'), findsOneWidget);
  });

  testWidgets('TabBar and BottomNavigationBar switch the same tabs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // First tab (Home) content is shown.
    expect(find.text('Counter Value'), findsOneWidget);

    // Switch to the About tab using the TabBar.
    await tester.tap(
      find.descendant(of: find.byType(TabBar), matching: find.text('About')),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('This app demonstrates'), findsOneWidget);

    // Switch back to the Home tab using the BottomNavigationBar.
    await tester.tap(
      find.descendant(
        of: find.byType(BottomNavigationBar),
        matching: find.text('Home'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Counter Value'), findsOneWidget);
  });
}