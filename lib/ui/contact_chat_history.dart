import 'package:flutter/material.dart';
import 'package:amra_amra/widgets/chathistory_bottomsheet.dart';

class ContactChatHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Center(
              child: Text(
                'Contacts will be here',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
          ChatHistoryBottomSheet()
        ],
      ),
    );
  }
}
