import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pabeda_app/main.dart';

void main() {
  testWidgets('App loads and shows the Home tab', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    await tester.pumpWidget(const PabedaApp());
    await tester.pumpAndSettle();

    expect(find.text('Pabeda'), findsOneWidget);
    expect(find.text('Contact For Any Query'), findsNothing);

    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();

    expect(find.text('Contact For Any Query'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });

  testWidgets('First launch shows onboarding before the app', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const PabedaApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Pabeda'), findsOneWidget);
    expect(find.text('Pabeda'), findsNothing);

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Pabeda'), findsNothing);
    expect(find.text('Pabeda'), findsOneWidget);
  });
}
