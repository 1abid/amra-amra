import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class ChatHistorySheetHeader extends StatelessWidget {
  final double topMargin;
  final double fontSize;
  final double leftMargin;

  ChatHistorySheetHeader({
    Key key,
    @required this.topMargin,
    @required this.fontSize,
    @required this.leftMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _appTextTheme = Theme.of(context).textTheme;
    final TextStyle titleStyle = _appTextTheme.headline.copyWith(
        color: KAmraAmraSurfaceWhite,
        fontWeight: FontWeight.w300,
        fontSize: fontSize);

    return Positioned(
      top: topMargin,
      left: leftMargin,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 5.0,
        ),
        child: Text(
          'Chat History',
          style: titleStyle,
        ),
      ),
    );
  }
}
