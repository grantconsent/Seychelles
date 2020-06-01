import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/dashboard.dart';
import 'package:grantconsent/screens/forgot_password.dart';
import 'package:grantconsent/screens/get_started_screen.dart';
import 'package:grantconsent/screens/loader.dart';
import 'package:grantconsent/services/firebase_sign_in.dart';
import 'package:grantconsent/services/firebase_sign_out.dart';
import 'package:grantconsent/services/firebase_sign_up.dart';

import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class WelcomeBack extends StatelessWidget {
  final TextEditingController _inputPassword = TextEditingController();
 // final scaffoldKey2 = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   key: scaffoldKey2,
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
              "${loggedInUser.name}",
              style: kWelcomeHeadingTextStyle,
            ),
            Text(
              kGrantConsent,
              style: kGrantConsentTextStyle,
            ),
            SizedBox(height: 80),
            CustomTextFormField(
                controller: _inputPassword,
                obscure: true,
                hintText: "Password"),
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
                  _signIn(context);
                },
                label: 'Log In'),
            SizedBox(height: 20),
            UserActionButton(
                onTap: () {
                  signOutUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetStarted()));
                },
                label: 'Not You?'),
          ],
        ),
      ),
    );
  }

  _signIn(BuildContext context) async {
    if (_inputPassword.text == "") {
      //If password is empty
      // scaffoldKey2.currentState
      Scaffold.of(context).showSnackBar(
        customSnackBar(message: 'Enter Password'),
      );
    } else {
      showDialog(context: context, builder: (context) => Loader());
      ConsentUserSignIn email = ConsentUserSignIn(email: loggedInUser.email);
      SignInStatus operationStatus =
          await signInUser(newUser: email, password: _inputPassword.text);
      Navigator.pop(context);
      if (operationStatus == SignInStatus.success) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        _handleExceptions(
            operationStatus, context); //If sign in was NOT successful
      }
    }
  }

  void _handleExceptions(SignInStatus operationStatus, BuildContext context) {
    if (operationStatus == SignInStatus.emailUnverified) {
      //If sign in was NOT successful - EMAIL IS NOT VERIFIED
      Scaffold.of(context).showSnackBar(
        customSnackBar(
            message: 'Please verify your email.', durationInSeconds: 3),
      );
    } else if (operationStatus == SignInStatus.invalidEmail) {
      //If sign in was NOT successful - EMAIL IS INVALID
      Scaffold.of(context).showSnackBar(
        customSnackBar(
            message: 'You have entered an invalid email. Please try again',
            durationInSeconds: 3),
      );
    } else if (operationStatus == SignInStatus.userNotFound) {
      //If sign in was NOT successful - INVALID EMAIL ENTERED
      Scaffold.of(context).showSnackBar(
        customSnackBar(
            message:
                'This email does NOT have an account. Please Sign Up instead',
            durationInSeconds: 3),
      );
    } else if (operationStatus == SignInStatus.wrongPassword) {
      //If sign in was NOT successful - USER ALREADY EXISTS
      Scaffold.of(context).showSnackBar(
        customSnackBar(
            message: 'You have entered a wrong password', durationInSeconds: 3),
      );
    } else if (operationStatus == SignInStatus.unknownException) {
      //If sign in was NOT successful - UNKNOWN ERROR OCCURED
      Scaffold.of(context).showSnackBar(
        customSnackBar(
            message: 'An unknown error occured. Try again',
            durationInSeconds: 3),
      );
    }
  }
}
