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
enum ConsentOptionType {
  yes,
  no,
}

//Dashboard Welcome Text

const List<String> dynamicWelcomeText = [
  'Silence does not mean yes.',
  'Never assume. Ask before you proceed.',
  'The right to say no is a right you ought to exercise if you want your yes to mean something.',
  'Hesitance is not consent.',
  'Being in a relationship is not consent.',
  'No means No.',
  'Wait means No.',
  'Not now means No.',
  'No is a complete Sentence. It doesn\'t require justification or Explanation.',
  'We\'ve had sex before is not consent.',
  'Consent to one act is not consent to all acts.',
  'If they aren\'t sober they can\'t consent.',
  'Coercion is not Consent.',
  'Flirting is not Consent.',
  'If they don\'t feel free to say "NO", it\'s not consent.',
  'No does not mean convince me.',
  'Consent is Mandatory.',
  'Only do it with Consent.',
  'Consent: if you don\'t get it you don\'t get it.',
  'Rape is not the presence of NO, it\'s the absence of yes.',
  'Alone is not Consent.',
  'Drunk is not Consent.',
  'Ask before Unwrapping.',
  'It\'s okay to say No.',
  'I would give you infinate cuddles if you properly consented me to do so.',
  'Consent Matters.',
  'Sex you want? Ask for Consent You Must.',
  'Clothing is Not Consent',
  'Never assume consent.',
  'Got Consent?',
  'You never Owe Sex, Your Sex is your own.',
  'Consent is Sexy.',
  'Have Consent From the Cutie before You Can Touch the Booty.'
];
