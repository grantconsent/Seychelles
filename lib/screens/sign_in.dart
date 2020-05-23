import 'package:flutter/material.dart';
import 'package:grantconsent/screens/sign_up.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 35.0, right: 35.0, top: 35.0, bottom: 5),
                          child: GrantConsentLogo(LogoType.mediumWithText)),
                    ],
                  ),
                ],
              ),
            ),
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
                        hintText: "Phone Number",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    CustomTextFormField(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Checkbox(
                                value: checkBoxValue,
                                activeColor: kButtonTextColor2,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    checkBoxValue = newValue;
                                  });
                                }),
                            Text(
                              'remember me',
                              style: TextStyle(color: kButtonTextColor2),
                            ),
                          ]),
                          Text(
                            'forgot password?',
                            style: TextStyle(color: kButtonTextColor2),
                          )
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
//                                  sign in
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
            padding: const EdgeInsets.only(bottom: 15.0, top: 30),
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
                    Navigator.push(context,
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
}
