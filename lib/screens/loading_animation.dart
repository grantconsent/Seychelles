import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grantconsent/screens/splash_screen.dart';
import 'package:grantconsent/screens/welcome_back.dart';
import 'package:grantconsent/services/firebase_check_for_user.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
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
  bool _finishedCheckingPreviousUser =
      false; //bool to indicate if checking has finished and screen can proceed.
  ConsentUser
      user; //is null if no current user, is NOT null if user exists. Screen responds to change in this value.

  void _runAnimation() async{
    scaleAnimationController.forward();
    scaleAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        scaleAnimationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        if (!_finishedCheckingPreviousUser) {
          scaleAnimationController.forward();
        } else {
          slideAnimationController.forward();
          setState(() {
            opacity = 1.0;
          });
        }
      }
    });
  }

  void _checkPreviousUser() async {
    user = await checkForUser();
    loggedInUser = user;
    _finishedCheckingPreviousUser = true;
  }

  @override
  void initState() {
    super.initState();
    slideAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration);
    scaleAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration);
    handleDynamicLinks();
    _runAnimation();
    _checkPreviousUser();
  }
  Future handleDynamicLinks ()async{
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLinksData)async{
          _handleDeepLink(dynamicLinksData);
        },
        onError: (OnLinkErrorException e)async{
          print('Dynamic Link error ${e.message}');
        }
    );

  }
  void _handleDeepLink (PendingDynamicLinkData data){
    Uri deeplink = data?.link;
    if (deeplink != null){
      print('deeplink : $deeplink');
    Navigator.pushNamed(context, deeplink.path);
    }
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    CurveTween scaleCurveTween = CurveTween(curve: Curves.easeInExpo);
    scaleAnimation = Tween<double>(
      begin: 1,
      end: kLoadingScreenAnimationScale,
    ).chain(scaleCurveTween);

    final screenHeight = kScreenSize.height;

    //Offset Points for the logo image
    double logoImageYEndOffset = (screenHeight - 2.4) - screenHeight;
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
          child: user == null
              ? SplashScreen()
              : WelcomeBack(), //Pass user to WelcomeBack() screen //Global variable for user created and used 
          opacity: opacity,
          duration: kLoadingScreenAnimationDuration,
        ),
        Center(
          child: ScaleTransition(
            scale: scaleAnimationController.drive(scaleAnimation),
            child: SlideTransition(
              position: slideAnimationController.drive(logoImageSlideAnimation),
              child: user != null
                  ? null
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Hero(
                          child: GrantConsentLogo(LogoType.mediumWithoutText),
                          tag: "logoHeroTag",
                        ),
                        AnimatedOpacity(
                          opacity: opacity,
                          duration: kLoadingScreenAnimationDuration,
                          child: Text(
                            'CONSENT',
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              color: kButtonTextColor2,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
