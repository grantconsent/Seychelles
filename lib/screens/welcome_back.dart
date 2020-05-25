import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/forgot_password.dart';
import 'package:grantconsent/services/firebase_sign_out.dart';
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    'forgot password?',
                    style: TextStyle(color: kButtonTextColor2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            UserActionButton(
                onTap: () {
                  signOutUser();
                },
                label: 'Log In'),
          ],
        ),
      ),
    );
  }
}
