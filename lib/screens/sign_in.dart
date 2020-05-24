import 'package:flutter/material.dart';
import 'package:grantconsent/screens/sign_up.dart';
import 'package:grantconsent/screens/test_screen_2.dart';
import 'package:grantconsent/services/firebase_sign_in.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool checkBoxValue = false;

  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 35.0, right: 35.0, top: 90.0, bottom: 5),
                child: GrantConsentLogo(LogoType.mediumWithText)),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: CustomTextFormField(
                        controller: inputEmail,
                        hintText: "Email Address",
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
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
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: checkBoxValue,
                              activeColor: kButtonTextColor2,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkBoxValue = newValue;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'remember me',
                              style: TextStyle(color: kButtonTextColor2),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // _resetPassword(context);
                            },
                            child: Text(
                              'forgot password?',
                              style: TextStyle(color: kButtonTextColor2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: UserActionButton(
                                onTap: () {
                                  _signIn(context);
                                },
                                label: 'Sign In',
                                filled: true),
                          ),
                          Text("OR", style: kOrTextStyle),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: UserGoogleButton(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(color: kButtonTextColor2, fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

 
  _signIn(BuildContext context) async {
    ConsentUserSignIn email = ConsentUserSignIn(email: inputEmail.text);
    SignInStatus operationStatus =
        await signInUser(newUser: email, password: inputPassword.text);
    if (operationStatus == SignInStatus.success) {
      // If sign in was successfull
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TestScreen2()));
    } else {
      //If sign in was NOT successful
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Incorrect Username or Password.'),
      );
    }
  }
}
