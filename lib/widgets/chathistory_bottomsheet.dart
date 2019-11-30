import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';
import 'dart:math';
import 'package:amra_amra/widgets/menu_button.dart';
import 'package:amra_amra/widgets/chat_history_sheet_header.dart';
import 'package:amra_amra/model/chat_history.dart';
import 'package:flutter/material.dart' as prefix0;

const double minHeight = 120;
const double iconStartSize = 30; //<-- add edge values
const double iconEndSize = 80; //<-- add edge values
const double iconStartMarginTop = 36; //<-- add edge values
const double iconEndMarginTop = 80; //<-- add edge values
const double iconsVerticalSpacing = 24; //<-- add edge values
const double iconsHorizontalSpacing = 16; //<-- add edge values

class ChatHistoryBottomSheet extends StatefulWidget {
  @override
  _ChatHistoryBottomSheetState createState() => _ChatHistoryBottomSheetState();
}

class _ChatHistoryBottomSheetState extends State<ChatHistoryBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double get maxHeight => MediaQuery.of(context).size.height;

  double get topMargin => lerp(
        20.0,
        20.0 + MediaQuery.of(context).padding.top,
      );

  double get leftMargin => lerp(
        5.0,
        ((MediaQuery.of(context).size.width) / 4) * 0.4,
      );

  double get fontSize => lerp(16.0, 32.0);

  double get iconSize =>
      lerp(iconStartSize, iconEndSize); //<-- increase icon size

  double iconTopMargin(int index) =>
      lerp(
        iconStartMarginTop,
        iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
      ) +
      topMargin;

  double iconLeftMargin(int index) => lerp(
        index * (iconsHorizontalSpacing + iconStartSize),
        0,
      );

  double get itemBorderRadius => lerp(8, 16);

  double lerp(double min, double max) => lerpDouble(
        min,
        max,
        _animationController.value,
      );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: lerp(minHeight, maxHeight),
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              decoration: BoxDecoration(
                color: KAmraAmraBluePrimary,
                gradient: LinearGradient(
                  colors: [KAmraAmraBluePrimary, KAmraAmraBlueDark],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: KAmraAmraBluePrimary,
                    offset: Offset(2.0, -2.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  )
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32.0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  MenuButton(this._animationController),
                  ChatHistorySheetHeader(
                    topMargin: topMargin,
                    leftMargin: leftMargin,
                    fontSize: fontSize,
                  ),
                  for (ChatHistory chat in chatHistories)
                    _chatHistoryIcon(chat),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    final bool isOpen =
        _animationController.status == AnimationStatus.completed;
    _animationController.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0.0)
      _animationController.fling(velocity: max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _animationController.fling(
          velocity: min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _animationController.fling(
          velocity: _animationController.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }

  Widget _chatHistoryIcon(ChatHistory chat) {
    final int index = chatIndex(chat);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: KAmraAmraOrangeAccent,
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(itemBorderRadius),
            bottom: Radius.circular(itemBorderRadius),
          ),
        ),
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(itemBorderRadius),
            bottom: Radius.circular(itemBorderRadius),
          ),
          child: Image.asset(
            chat.assetName,
            fit: BoxFit.cover,
            alignment: Alignment(lerp(1, 0), 0),
          ),
        ),
      ),
    );
  }
}
