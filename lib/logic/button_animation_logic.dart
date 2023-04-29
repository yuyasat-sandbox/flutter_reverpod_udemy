import 'package:flutter/animation.dart';
import 'package:flutter_reverpod_udemy/data/count_data.dart';
import 'package:flutter_reverpod_udemy/logic/count_data_changed_notifier.dart';
import 'dart:math' as math;

class ButtonAnimationLogic with CountDataChangedNotifier {
  late AnimationController _animationController;
  late AnimationConbination _animationConbination;

  get animationConbination => _animationConbination;

  ValueChangedCondition startCondition;

  ButtonAnimationLogic(TickerProvider tickerProvider, this.startCondition) {
    _animationController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
    );

    var animationScale = _animationController
        .drive(CurveTween(curve: const Interval(0.1, 0.7))) // 500の10%から70%まで。
        .drive(Tween(begin: 1.0, end: 1.8));

    var animationRotation = _animationController
        .drive(CurveTween(
            curve: Interval(
          0.4,
          0.9,
          curve: ButtunRotateCurve(),
        ))) // 500の10%から70%まで。
        .drive(Tween(begin: 0.0, end: 1.0));
    _animationConbination =
        AnimationConbination(animationScale, animationRotation);
  }

  @override
  void valueChanged(CountData oldData, CountData newData) {
    if (startCondition(oldData, newData)) {
      start();
    }
  }

  void dispose() {
    _animationController.dispose();
  }

  void start() {
    _animationController.forward().whenComplete(
          () => _animationController.reset(),
        );
  }
}

class ButtunRotateCurve extends Curve {
  @override
  double transformInternal(double t) {
    return math.sin(t * math.pi * 2) / 16;
  }
}

class AnimationConbination {
  final Animation<double> animationScale;
  final Animation<double> animationRotation;

  AnimationConbination(
    this.animationScale,
    this.animationRotation,
  );
}
