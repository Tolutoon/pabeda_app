import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pabeda_app/main.dart';

void main() {
  testWidgets('App loads and shows the Home tab', (WidgetTester tester) async {
    await tester.pumpWidget(const PabedaApp());
    await tester.pumpAndSettle();

    expect(find.text('Pabeda'), findsOneWidget);
    expect(find.text('Contact For Any Query'), findsNothing);

    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();

    expect(find.text('Contact For Any Query'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));
  });
}
