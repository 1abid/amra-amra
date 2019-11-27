import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _appTheme = Theme.of(context);

    final TextStyle msgTextTheme = _appTheme.textTheme.body1.copyWith(
      fontWeight: FontWeight.w400,
      color: KAmraAmraBackgroundWhite,
    );
    final TextStyle hintTextTheme = _appTheme.textTheme.overline.copyWith(
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.italic,
        color: KAmraAmraBackgroundWhite);
    return Material(
      elevation: 16.0,
      color: KAmraAmraBluePrimary,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Container(
        height: 120.0,
        child: Row(
          children: <Widget>[
            Material(
              child: Container(
                color: KAmraAmraBluePrimary,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () {},
                  color: KAmraAmraOrangeAccent,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 20.0),
                child: Container(
                  child: TextField(
                      focusNode: _focusNode,
                      style: msgTextTheme,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'write message',
                        labelText: 'message',
                        hintStyle: hintTextTheme,
                      )),
                ),
              ),
            ),
            Material(
              child: Container(
                color: KAmraAmraBluePrimary,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _textEditingController.clear();
                    FocusScope.of(context).hasFocus
                        ? _focusNode.unfocus()
                        : FocusScope.of(context).requestFocus(_focusNode);
                  },
                  color: KAmraAmraOrangeAccent,
                ),
              ),
            )
          ],
        ),
        width: double.infinity,
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
