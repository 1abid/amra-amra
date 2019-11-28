import 'package:flutter/material.dart';
import 'package:amra_amra/widgets/custom_appbar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MaterialApp app = MaterialApp(
    home: Scaffold(
      body: CustomAppBar(),
    ),
  );

  testWidgets(
    'Custom Appbar UI test',
    (WidgetTester tester) async {
      await tester.pumpWidget(app);

      expect(find.text('Faysal Khalashi'), findsOneWidget);
      expect(find.text('@morty'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

    },
  );
}
