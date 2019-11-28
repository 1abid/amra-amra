import 'package:flutter/material.dart';
import 'package:amra_amra/ui/conversation_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amra_amra/widgets/custom_appbar.dart';
import 'package:amra_amra/widgets/chatlist_widget.dart';
import 'package:amra_amra/widgets/input_widget.dart';

void main() {
  const MaterialApp app = MaterialApp(
    home: Scaffold(
      body: const ConversationPage(),
    ),
  );

  testWidgets(
    'ConversationPage UI test',
    (WidgetTester tester) async {
      await tester.pumpWidget(app);


      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(ChatListWidget), findsOneWidget);
      expect(find.byType(InputWidget), findsOneWidget);
    },
  );
}
