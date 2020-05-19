import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities//constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: GetStarted(),
));
class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex:3,
            ),
            Image(
                image: kGrantConsentGetStarted),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Image(
                image: kConsentImage,
              ),
            ),
//            ),),
            Spacer(
              flex: 4,
            ),
            Text('Welcome',
              style: GoogleFonts.quicksand(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: kButtonTextColor2,
              ),),
            Spacer(
              flex: 1,
            ),
            Text('Get a safe,sealed digital copy of consents.Don’t act on promises alone.Collect proof. Digitise your consent, Yes is Yes and No is No ',
              style: GoogleFonts.quicksand(
                fontSize: 15,
                color: kButtonTextColor2,
              ),),
            Spacer(
              flex: 2,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kButtonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                  Icon(Icons.arrow_forward_ios,
                    size: 20,)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kButtonColor,
                ),
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Sign In',
                    style: TextStyle(
                      color: kButtonTextColor2,
                      fontSize: 15,
                    ),),
                  Icon(Icons.arrow_forward_ios,
                    size: 20,
                    color: kButtonTextColor2,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10,10,10,15),
              child: Center(
                child: Text('Terms and Conditions',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                  ),),
              ),
            )
          ],
        ),
      ),

    );
  }
}



