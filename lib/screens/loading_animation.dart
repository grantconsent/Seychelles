import 'package:flutter/material.dart';
import 'package:grantconsent/screens/splash_screen.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class LoadingAnimation extends StatelessWidget {
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
  int repeatAnimation = 0;

  void loadApp() {
    splashScreenAnimation.addStatusListener((status) {
      if (status == AnimationStatus.reverse) repeatAnimation++;
      if (repeatAnimation == 3) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen()));
        animationController.dispose();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration);
    splashScreenAnimation =
        Tween<double>(begin: 1, end: kLoadingScreenAnimationScale)
            .animate(animationController)
              ..addListener(() {
                setState(() {});
              });
    animationController.repeat(reverse: true);

    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: splashScreenAnimation,
      alignment: Alignment.center,
      child: GrantConsentLogo(LogoType.mediumWithoutText),
    );
  }
}
