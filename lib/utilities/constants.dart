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
Widget kUploadingGIF = Image.asset(
  'assets/GIFs/cloudloop.gif',
  height: 90,
  width: 90,
  cacheHeight: 90,
  cacheWidth: 90,
  fit: BoxFit.cover,
);
Widget kUploadedGIF = Image.asset(
  'assets/GIFs/successmark.gif',
  height: 90,
  width: 90,
  cacheHeight: 90,
  cacheWidth: 90,
  fit: BoxFit.cover,
);

Widget kUserPicturePlaceholder = Image.asset('assets/GIFs/loaderloop.gif');
ImageProvider kGoogleLogo = AssetImage('assets/Google Logo.png');
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
