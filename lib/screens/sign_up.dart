import 'package:flutter/material.dart';
import 'package:grantconsent/screens/sign_in.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/services/firebase_sign_up.dart';

class SignUp extends StatelessWidget {
  final TextEditingController inputName = TextEditingController();
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPhoneNumber = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  // BuildContext context;
  _signUp(BuildContext context) async {
   
    if (inputPassword.text != confirmPassword.text) {   //If password do not match
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Password do not match.'),
      );
    } else { //if passwords match
      ConsentUser newUser = ConsentUser(
          name: inputName.text,
          email: inputEmail.text,
          phoneNumber: inputPhoneNumber.text);
      SignUpStatus operationStatus =
          await signUpUser(newUser: newUser, password: inputPassword.text);
      if (operationStatus == SignUpStatus.success) { // If sign up was successfull
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  actions: <Widget>[
                    AppIconButton(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              maintainState: true,
                              builder: (context) => SignIn()));
                    })
                  ],
                  title: Text(
                    'Confirm your Email',
                    style: kWelcomeHeadingTextStyle,
                  ),
                  content: Container(
                      child: Text(
                          'Please click the link the email sent to you to confirm and log in')),
                ));
      } else { //If sign up was NOT successful
        scaffoldKey.currentState.showSnackBar(
          customSnackBar(message: 'You don fuck up sha'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CustomTextFormField(
                  hintText: 'Name',
                  controller: inputName,
                  textInputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CustomTextFormField(
                  hintText: 'Email',
                  controller: inputEmail,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CustomTextFormField(
                  hintText: 'Phone Number',
                  controller: inputPhoneNumber,
                  textInputType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: CustomTextFormField(
                  hintText: 'Password',
                  controller: inputPassword,
                  obscure: true,
                ),
              ),
              CustomTextFormField(
                hintText: 'Confirm Password',
                controller: confirmPassword,
                obscure: true,
              ),
              Spacer(flex: 1),
              UserActionButton(
                onTap: () {
                  _signUp(context);
                },
                label: 'Sign Up',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("OR", style: kOrTextStyle),
                ),
              ),
              UserGoogleButton(onTap: null),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: kButtonTextColor2, fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
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
            ],
          ),
        ),
      ),
    );
  }
}
