import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grantconsent/screens/splash_screenE.dart';
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
    with TickerProviderStateMixin {
  var repeatAnimation = 0;

  @override
  void initState() {
    super.initState();
    slideAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration);
    scaleAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          scaleAnimationController.reverse();
          scaleAnimationController.addStatusListener((status) {
            if(status == AnimationStatus.dismissed){
              slideAnimationController.forward();
              setState(() {
                opacity = 1.0;
              });
            }
          });
        }
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    CurveTween scaleCurveTween = CurveTween(curve: Curves.easeInExpo);
    scaleAnimation = Tween<double>(
      begin: 1,
      end: kLoadingScreenAnimationScale,
    ).chain(scaleCurveTween);

    final screenHeight = MediaQuery.of(context).size.height;

    //Offset Points for the logo image
    double logoImageYEndOffset = (screenHeight - 3.2) - screenHeight;
    double logoImageXEndOffset = -1.5;

    //Offset Points for the logo text
    double textImageYEndOffset = (screenHeight - 8.5) - screenHeight;
    double textImageXEndOffset = -1.4;

    //Curve tween to make the animation fast initially and slow
    CurveTween slideTweenCurve = CurveTween(
      curve: Curves.fastLinearToSlowEaseIn,
    );

    logoImageSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(logoImageXEndOffset, logoImageYEndOffset),
    ).chain(slideTweenCurve);

    logoTextSlideAnimation = Tween<Offset>(
      begin: Offset(textImageXEndOffset, 0),
      end: Offset(textImageXEndOffset, textImageYEndOffset),
    ).chain(slideTweenCurve);
  }

  AnimationController scaleAnimationController;
  Animatable<double> scaleAnimation;

  AnimationController slideAnimationController;
  Animatable<Offset> logoImageSlideAnimation;
  Animatable<Offset> logoTextSlideAnimation;

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          child: SplashScreenE(),
          opacity: opacity,
          duration: kLoadingScreenAnimationDuration,
        ),
        Center(
          child: ScaleTransition(
            scale: scaleAnimationController.drive(scaleAnimation),
            child: SlideTransition(
              position: slideAnimationController.drive(logoImageSlideAnimation),
              child: Hero(
                child: GrantConsentLogo(LogoType.mediumWithoutText),
                tag: "logoHeroTag",
              ),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: opacity,
            child: SlideTransition(
              position: slideAnimationController.drive(logoTextSlideAnimation),
              child: Text(
                'CONSENT',
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  color: kButtonTextColor2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
