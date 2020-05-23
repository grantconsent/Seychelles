import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class WelcomeBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            Text(
              kWelcomeBack,
              style: kWelcomeHeadingTextStyle,
            ),
            Text(
              "'Bami.",
              style: kWelcomeHeadingTextStyle,
            ),
            Text(
              kGrantConsent,
              style: kGrantConsentTextStyle,
            ),
            SizedBox(height: 80),
            CustomTextFormField(
              hintText: 'Password',
              obscure: true,
              icon: Icon(
                Icons.remove_red_eye,
                size: 15,
                color: kButtonTextColor2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'forgot password?',
                  style: TextStyle(color: kButtonTextColor2, fontSize: 13),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kButtonColor,
                border: null, //: Border.all(color: kButtonColor),
              ),
              child: RawMaterialButton(
                padding: EdgeInsets.only(left: 40, right: 14.4),
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Log In',
                      style: kButtonTextStyle,
                    ),
                    Icon(Icons.chevron_right,
                        color: kButtonTextColor1 //: kButtonTextColor2,
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
