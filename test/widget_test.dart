// This is a basic Flutter widget test for Smart Pet Manager app.

import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_hw_2/main.dart';

void main() {
  testWidgets('Smart Pet Manager displays pets correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SmartPetManagerApp());

    // Verify that the app title is displayed
    expect(find.text('Smart Pet Manager'), findsOneWidget);

    // Verify that all three pets are displayed
    expect(find.text('Dog: Buddy (Mixed)'), findsOneWidget);
    expect(find.text('Cat: Mia (Orange)'), findsOneWidget);
    expect(find.text('Bird: Tweety (Canary)'), findsOneWidget);

    // Verify that pet sounds are displayed
    expect(find.text('Woof Woof!'), findsOneWidget);
    expect(find.text('Meow!'), findsOneWidget);
    expect(find.text('Chirp Chirp!'), findsOneWidget);

    // Verify that total pets count is displayed
    expect(find.text('Total Pets: 3'), findsOneWidget);
  });
}
