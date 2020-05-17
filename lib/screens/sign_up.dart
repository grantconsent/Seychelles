import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/sign_in.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.tight(kScreenSize),
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(flex: 2),
              GrantConsentLogo(LogoType.mediumWithText),
              Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: CustomTextFormField(
                  hintText: 'Name',
//                  labelText: 'Name',
                  textInputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: CustomTextFormField(
                  hintText: 'Email',
//                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: CustomTextFormField(
                  hintText: 'Phone Number',
//                  labelText: 'Phone Number',
                  textInputType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: CustomTextFormField(
                  hintText: 'Password',
//                  labelText: 'Password',
                  obscure: true,
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 15,
                    color: kButtonTextColor2,
                  ),
                ),
              ),
              CustomTextFormField(
                hintText: 'Confirm Password',
//                labelText: 'Confirm Password',
                obscure: true,
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 15,
                  color: kButtonTextColor2,
                ),
              ),
              Spacer(flex: 1),
              UserActionButton(
                onTap: () {
                  //sign up
                },
                label: 'Sign Up',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "OR",
                    style: kOrTextStyle
                  ),
                ),
              ),
              UserGoogleButton(onTap: null),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 30),
                child: GestureDetector(
                  onTap: () {
//                on tap sign in
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account? ',
                        style:
                        TextStyle(color: kButtonTextColor2, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}