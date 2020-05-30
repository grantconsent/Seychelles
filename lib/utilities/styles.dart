import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const Color kBackgroundColor = Color(0xFF222222);
const Color kButtonColor = Color(0xFFCAB480);
const Color kButtonTextColor1 = Color(0xFF222222);
const Color kButtonTextColor2 = Color(0xFFCAB480);
const Color kInactiveSlideDotColor = Color(0xFF535353);
const Color kGoogleButtonColor = Color(0xff4285f4);
const Color kDashboardBackgroundColor = Color(0xffdcd4c4);
//Text Styles

final kBody1TextStyle = GoogleFonts.quicksand(
  fontWeight: FontWeight.normal,
  //letterSpacing: 1.5,
  fontSize: 15,
  color: kButtonTextColor2,
);

final kWelcomeHeadingTextStyle = GoogleFonts.quicksand(
  fontSize: 40,
  fontWeight: FontWeight.w500,
  color: kButtonTextColor2,
);
final kWelcomeDashboardTextStyle = GoogleFonts.quicksand(
  fontSize: 40,
  fontWeight: FontWeight.w500,

);
final kDashboardOptionTextStyle = GoogleFonts.roboto(


);
final kDashboardLoggedInEmailTextStyle = GoogleFonts.openSans(
  fontWeight: FontWeight.bold,
  color: Color(0xffCAB480),
);
final kDashboardFooterTextStyle = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 14
);
final kDashboardLoggedInNameTextStyle = GoogleFonts.openSans(
    fontSize: 18
);
final kDashboardHeaderTextStyle = GoogleFonts.quicksand(

  fontWeight: FontWeight.w500,
);
final kDashboardDynamicTextStyle = GoogleFonts.quicksand(
  fontSize: 20,
  fontWeight: FontWeight.w300,

);
final kButtonTextStyle = GoogleFonts.roboto(
  fontSize: 15,
  height: 1.20,
  fontWeight: FontWeight.w300,
  color: kButtonTextColor1,
);
final kOrTextStyle = GoogleFonts.roboto(
  fontSize: 15,
  color:Colors.white,
);
final kGoogleButtonLabelStyle = GoogleFonts.roboto(
  fontSize: 15,
  height: 1.20,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);
final kGrantConsentTextStyle = GoogleFonts.quicksand(
  fontWeight: FontWeight.normal,
  //letterSpacing: 1.5,
  fontSize: 15,
  color: Colors.white,
);

final kInputTextStyle = GoogleFonts.roboto(
  fontSize: 17,
color: kButtonTextColor2,
fontWeight: FontWeight.w400,
);