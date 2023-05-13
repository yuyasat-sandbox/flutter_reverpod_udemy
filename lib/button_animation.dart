import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reverpod_udemy/logic/button_animation_logic.dart';

// ignore: must_be_immutable
class ButtonAnimation extends StatelessWidget {
  final AnimationConbination animationConbination;
  final Widget child;

  const ButtonAnimation({
    Key? key,
    required this.animationConbination,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animationConbination.animationScale,
      child: RotationTransition(
        turns: animationConbination.animationRotation,
        child: child,
      ),
    );
  }
}
