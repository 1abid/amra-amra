import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';
import 'dart:math';
import 'package:amra_amra/widgets/menu_button.dart';
import 'package:amra_amra/widgets/chat_history_sheet_header.dart';

const double minHeight = 120;

class ChatHistoryBottomSheet extends StatefulWidget {
  @override
  _ChatHistoryBottomSheetState createState() => _ChatHistoryBottomSheetState();
}

class _ChatHistoryBottomSheetState extends State<ChatHistoryBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double get maxHeight => MediaQuery.of(context).size.height;

  double get topMargin => lerp(20.0, 20.0 + MediaQuery.of(context).padding.top);

  double get leftMargin => lerp(
        5.0,
        ((MediaQuery.of(context).size.width) / 4) * 0.4,
      );

  double get fontSize => lerp(16.0, 32.0);

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
                    blurRadius: 10.0,
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
                  )
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
}
