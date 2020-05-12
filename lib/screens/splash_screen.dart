import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> splashScreenAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: kSplashScreenAnimationDuration);
    splashScreenAnimation =
        Tween<double>(begin: 1, end: kSplashScreenAnimationScale).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: splashScreenAnimation,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 78.9, height: 78.0),
        child: Image(
          image: kGrantConsentLogo,
        ),
      ),
    );
  }
}
