
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';
import 'package:supernova_flutter_ui_toolkit/transitions.dart';


class logoImage extends StatelessWidget {
  logoImage({Key key, AnimationController logoImageAnimationController}) :
    translateY = Interpolation<double>(keyframes: [
      Keyframe<double>(fraction: 0, value: 0),
      Keyframe<double>(fraction: 0.001, value: 300),
      Keyframe<double>(fraction: 1, value: 0),
    ]).animate(CurvedAnimation(
      parent: logoImageAnimationController,
      curve: Interval(0, 0.85, curve: Cubic(0.29, 0.872, 1, 1)),
    )),
    opacity = Interpolation<double>(keyframes: [
      Keyframe<double>(fraction: 0, value: 1),
      Keyframe<double>(fraction: 0.001, value: 0),
      Keyframe<double>(fraction: 1, value: 1),
    ]).animate(CurvedAnimation(
      parent: logoImageAnimationController,
      curve: Interval(0, 0.35, curve: Cubic(0.42, 0, 0.58, 1)),
    )),
    rotation = Interpolation<double>(keyframes: [
      Keyframe<double>(fraction: 0, value: 0),
      Keyframe<double>(fraction: 0.001, value: -0.125),
      Keyframe<double>(fraction: 0.7, value: -0.125),
      Keyframe<double>(fraction: 1, value: 0),
    ]).animate(CurvedAnimation(
      parent: logoImageAnimationController,
      curve: Interval(0, 1, curve: Cubic(0.42, 0, 0.58, 1)),
    )),
  super(key: key);
  Animation<double> translateY;
  Animation<double> opacity;
  Animation<double> rotation;
  
  @override
  Widget build(BuildContext context) {
  
    return FadeTransition(
      opacity: this.opacity,
      child: TranslationTransition(
        translationY: this.translateY,
        child: RotationTransition(
          turns: this.rotation,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(51, 0, 0, 0),
                  offset: Offset(0, 20),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/BoombaLogo2.png",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}