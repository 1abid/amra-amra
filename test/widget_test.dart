

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:amra_amra/main.dart';

void main() {
  testWidgets('a dumb and unnecessary test to see how CI works ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(find.text('Hello World'), findsOneWidget);
  });
}
