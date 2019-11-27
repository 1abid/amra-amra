import 'package:amra_amra/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:amra_amra/widgets/chatlist_widget.dart';
import 'package:amra_amra/widgets/input_widget.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ChatListWidget(),
              InputWidget()
            ],
          )
        ],
      ),
    );
  }
}
