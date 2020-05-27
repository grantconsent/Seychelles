import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/screens/get_started_screen.dart';
import 'package:grantconsent/services/firebase_sign_in.dart';
import 'package:grantconsent/services/firebase_sign_out.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:grantconsent/screens/test_screen_2.dart';

class WelcomeBack extends StatefulWidget {
  WelcomeBack({this.currentUser});
  ConsentUser currentUser;

  @override
  _WelcomeBackState createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  final TextEditingController inputPassword = TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              "${widget.currentUser.name}",
              style: kWelcomeHeadingTextStyle,
            ),
            Text(
              kGrantConsent,
              style: kGrantConsentTextStyle,
            ),
            SizedBox(height: 80),
            CustomTextFormField(
                controller: inputPassword,
                obscure: true,
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 15,
                  color: kButtonTextColor2,
                ),
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
    if (inputPassword.text == "") {
      //If password is empty
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Enter Password'),
      );
    } else {
      ConsentUserSignIn email =
          ConsentUserSignIn(email: widget.currentUser.email);
      SignInStatus operationStatus =
          await signInUser(newUser: email, password: inputPassword.text);
      var user = await FirebaseAuth.instance.currentUser();
      if (operationStatus == SignInStatus.success) {
        if (user.isEmailVerified) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TestScreen2()));
        } else {
          scaffoldKey.currentState.showSnackBar(
            customSnackBar(message: 'Please verify your email.'),
          );
        }
      } else {
        scaffoldKey.currentState.showSnackBar(
          customSnackBar(message: 'Incorrect Username or Password.'),
        );
      }
    }
  }
}
