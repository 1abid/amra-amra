import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';
import 'package:intl/intl.dart';

class ChatItemWidget extends StatelessWidget {
  final int index;

  ChatItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final ThemeData _appTheme = Theme.of(context);

    final TextStyle sentMsgTextTheme = _appTheme.textTheme.body1.copyWith(
      fontWeight: FontWeight.w400,
    );

    final TextStyle receivedMsgTextTheme = _appTheme.textTheme.body1.copyWith(
      fontWeight: FontWeight.w400,
      color: KAmraAmraSurfaceWhite,

    );

    if (index % 2 == 0) {
      //a sent message
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: KAmraAmraSentMessageBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: KAmraAmraOrangeAccent)
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'a dummy sent message',
                    style: sentMsgTextTheme,
                  ),
                  padding: EdgeInsets.all(10.0),
                  width: 200,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Text(
                    '${DateFormat.yMMMMd("en_US").format(DateTime.now())}  ${DateFormat.jm().format(DateTime.now())}',
                    style: _appTheme.textTheme.overline,
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      // a received message
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    'a dummy received message',
                    style: receivedMsgTextTheme,
                  ),
                  padding: EdgeInsets.all(10.0),
                  width: 200,
                  decoration: BoxDecoration(
                    color: KAmraAmraReceivedMessageBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }
}
