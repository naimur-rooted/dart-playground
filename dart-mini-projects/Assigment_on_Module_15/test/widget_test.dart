import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assigment_on_module_15/main.dart';

void main() {
  testWidgets('profile card displays all profile information', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Profile picture, name, profession, bio, contact info.
    expect(find.byType(CircleAvatar), findsWidgets);
    expect(find.text(kProfile.name), findsWidgets);
    expect(find.text(kProfile.profession), findsWidgets);
    expect(find.text(kProfile.bio), findsWidgets);
    expect(find.text(kProfile.email), findsWidgets);
    expect(find.text(kProfile.phone), findsWidgets);

    // The profile card uses a Card widget.
    expect(find.byType(Card), findsWidgets);

    // Interests are shown as chips.
    for (final interest in kProfile.interests) {
      expect(find.text(interest.label), findsWidgets);
    }

    // Both action buttons are present.
    expect(find.byKey(const Key('follow_button')), findsOneWidget);
    expect(find.byKey(const Key('view_profile_button')), findsOneWidget);
  });

  testWidgets('Follow button shows a SnackBar when pressed', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Initially the button says "Follow".
    expect(find.text('Follow'), findsOneWidget);

    // Scroll the Follow button into view (test default screen is 800x600).
    await tester.ensureVisible(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();

    // Tap the Follow button.
    await tester.tap(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();

    // A SnackBar should now be visible with the follow message.
    expect(find.textContaining('followed'), findsOneWidget);
  });

  testWidgets('Follow button toggles to "Following" using setState', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Follow'), findsOneWidget);

    // Scroll the button into view and tap (Follow -> Following).
    await tester.ensureVisible(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();
    expect(find.text('Following'), findsOneWidget);

    // Tap again (Following -> Follow).
    await tester.tap(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();
    expect(find.text('Follow'), findsOneWidget);
  });

  testWidgets('View Profile button opens an AlertDialog with details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Scroll the View Profile button into view.
    await tester.ensureVisible(find.byKey(const Key('view_profile_button')));
    await tester.pumpAndSettle();

    // Tap the View Profile button.
    await tester.tap(find.byKey(const Key('view_profile_button')));
    await tester.pumpAndSettle();

    // The dialog should be visible with the title and user details.
    expect(find.text('Profile Details'), findsOneWidget);
    expect(find.text('Name:'), findsOneWidget);
    expect(find.text('Profession:'), findsOneWidget);
    expect(find.text('Email:'), findsOneWidget);
    expect(find.text('Phone:'), findsOneWidget);
    expect(find.text('Interests'), findsWidgets);

    // Close the dialog.
    await tester.tap(find.byKey(const Key('dialog_close_button')));
    await tester.pumpAndSettle();
    expect(find.text('Profile Details'), findsNothing);
  });

  testWidgets('SnackBar disappears after a few seconds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('follow_button')));
    await tester.pumpAndSettle();

    // SnackBar is visible.
    expect(find.textContaining('followed'), findsOneWidget);

    // Advance time past the SnackBar duration (1s) and let the
    // dismiss animation settle.
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.textContaining('followed'), findsNothing);
  });
}
