import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class ExpandedChatHistoryRow extends StatelessWidget {
  final double topMargin;
  final double height;
  final bool isVisible;
  final String name;
  final String message;
  final String time;

  ExpandedChatHistoryRow({
    Key key,
    this.topMargin,
    this.height,
    this.isVisible,
    this.name,
    this.message,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      top: topMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Container(
          margin: EdgeInsets.only(left: height),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: KAmraAmraOrangeAccent,
              ),
            ),
          ),
          child: _buildContent(Theme.of(context)),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData appTheme) {
    final TextStyle nameTextStyle =
        appTheme.textTheme.subtitle.copyWith(color: KAmraAmraSurfaceWhite);

    final TextStyle messageTextStyle =
        appTheme.textTheme.body2.copyWith(color: KAmraAmraSurfaceWhite);

    final TextStyle timeTextStyle =
        appTheme.textTheme.caption.copyWith(color: KAmraAmraOrangeAccent);

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  name,
                  style: nameTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
                child: Text(
                  message,
                  style: messageTextStyle,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            right: 2.0,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              time,
              style: timeTextStyle,
            ),
          ),
        )
      ],
    );
  }
}
