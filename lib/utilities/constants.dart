import 'package:flutter/material.dart';

//Assets
final ImageProvider kGrantConsentLogo =
    AssetImage('assets/GrantConsentLogo.png');

final ImageProvider kSplashPage1Image = AssetImage('assets/Splash image 1.png');
final ImageProvider kSplashPage2Image = AssetImage('assets/Splash image 2.png');
final ImageProvider kGetStartedScreenBackground =
    AssetImage('assets/seductive_woman.png');
final Widget kUploadingGIF = Image.asset(
  'assets/GIFs/cloudloop.gif',
  height: 90,
  width: 90,
  cacheHeight: 90,
  cacheWidth: 90,
  fit: BoxFit.cover,
);
final Widget kUploadedGIF = Image.asset(
  'assets/GIFs/successmark.gif',
  height: 90,
  width: 90,
  cacheHeight: 90,
  cacheWidth: 90,
  fit: BoxFit.cover,
);
final Widget kLoaderGIF = Image.asset('assets/GIFs/loaderloop.gif');

final Widget kUserPicturePlaceholder =
    Image.asset('assets/GIFs/loaderloop.gif');
final ImageProvider kGoogleLogo = AssetImage('assets/Google Logo.png');
const int kNumberOfSplashPages = 2;

//Strings
const String kSplashPage1Text =
    'Digitise your consent. Yes is Yes and No is No.';
const String kSplashPage2Text = 'Get consent before you get in trouble.';
const String kWelcomeBack = 'Welcome back,';
const String kGrantConsent = 'Grant consent today.';

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
