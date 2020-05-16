import 'package:flutter/material.dart';

//Assets
ImageProvider kGrantConsentLogo = AssetImage('assets/GrantConsentLogo.png');
ImageProvider kGrantConsentGetStarted =
    AssetImage('assets/GrantConsentGetStartedLogo.png');
ImageProvider kConsentImage = AssetImage('assets/CONSENT.png');
ImageProvider kSplashPage1Image = AssetImage('assets/Splash image 1.png');
ImageProvider kSplashPage2Image = AssetImage('assets/Splash image 2.png');
ImageProvider kGetStartedScreenBackground =
    AssetImage('assets/seductive_woman.png');
const int kNumberOfSplashPages = 2;

//Strings
const String kSplashPage1Text =
    'Digitise your consent. Yes is Yes and No is No.';
const String kSplashPage2Text = 'Get consent before you get in trouble.';

//Sizes
Size kScreenSize;

//Animations
const Duration kLoadingScreenAnimationDuration = Duration(seconds: 1);
const double kLoadingScreenAnimationScale = 1.85;
const Duration kSplashScreenPageAnimationDuration = Duration(milliseconds: 500);

//Enums
enum LogoType {
  mediumWithText,
  mediumWithoutText,
  largeWithText,
  largeWithoutText,
}
