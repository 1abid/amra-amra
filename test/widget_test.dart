
import 'package:flutter_test/flutter_test.dart';
import 'package:amra_amra/widgets/chatlist_widget.dart';

import 'package:amra_amra/main.dart';

void main() {
  testWidgets('smoke test for main app entry UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(AmraAmra());
    expect(find.byType(ChatListWidget),findsOneWidget);
  });
}
