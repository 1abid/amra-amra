import 'package:flutter/material.dart';
import 'package:amra_amra/theme/colors.dart';

class MenuButton extends StatelessWidget {
  final AnimationController _controller;

  MenuButton(this._controller);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 24,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        color: KAmraAmraOrangeAccent,
        progress: _controller,
      ),
    );
  }
}
