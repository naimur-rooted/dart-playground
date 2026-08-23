// Widget tests for the Student Profile Card app.

import 'package:flutter_test/flutter_test.dart';
import 'package:student_info/main.dart';

void main() {
  testWidgets('App shows shimmer loading then student profile card', (
    WidgetTester tester,
  ) async {
    // Build the app.
    await tester.pumpWidget(const StudentProfileApp());

    // While loading, the student data should not be visible.
    expect(find.text('Mike Rack'), findsNothing);
    expect(find.text('STU-2025-0042'), findsNothing);
    expect(find.text('View Details'), findsNothing);

    // Wait for the 3-second shimmer to finish.
    await tester.pump(const Duration(seconds: 3));

    // After loading, the profile card content should be displayed.
    expect(find.text('Mike Rack'), findsOneWidget);
    expect(find.text('ID: STU-2025-0042'), findsOneWidget);
    expect(find.text('Computer Science & Engineering'), findsOneWidget);
    expect(find.text('View Details'), findsOneWidget);
    expect(find.text('Mark Present'), findsOneWidget);
  });

  testWidgets('View Details button opens a custom dialog', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentProfileApp());
    await tester.pump(const Duration(seconds: 3));

    // Tap the "View Details" button.
    await tester.tap(find.text('View Details'));
    await tester.pump();

    // The custom dialog with student details should be visible.
    expect(find.text('Student Details'), findsOneWidget);
    expect(find.text('Mike Rack'), findsWidgets);
    expect(find.text('STU-2025-0042'), findsWidgets);
    expect(find.text('Computer Science & Engineering'), findsWidgets);

    // Tap "Close" to dismiss the dialog.
    await tester.tap(find.text('Close'));
    await tester.pump();
    expect(find.text('Student Details'), findsNothing);
  });

  testWidgets('Mark Present button shows a success SnackBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentProfileApp());
    await tester.pump(const Duration(seconds: 3));

    // Tap the "Mark Present" button.
    await tester.tap(find.text('Mark Present'));
    await tester.pump(const Duration(milliseconds: 100));

    // The SnackBar success message should be visible.
    expect(find.text('Mike Rack marked as Present'), findsOneWidget);
  });
}
