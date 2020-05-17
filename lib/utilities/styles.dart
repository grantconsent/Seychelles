import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors
const Color kBackgroundColor = Color(0xFF222222);
const Color kButtonColor = Color(0xFFCAB480);
const Color kButtonTextColor1 = Color(0xFF222222);
const Color kButtonTextColor2 = Color(0xFFCAB480);
const Color kInactiveSlideDotColor = Color(0xFF535353);
const Color kGoogleButtonColor = Color(0xff4285f4);
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

final kButtonTextStyle = GoogleFonts.roboto(
  fontSize: 15,
  height: 1.20,
  fontWeight: FontWeight.w300,
  color: kButtonTextColor1,
);
final kOrTextStyle = GoogleFonts.roboto(
  fontSize: 20,
  color:Colors.white,
);
final kGoogleButtonLabelStyle = GoogleFonts.roboto(
  fontSize: 15,
  height: 1.20,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);