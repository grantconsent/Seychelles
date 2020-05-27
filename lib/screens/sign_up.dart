import 'package:flutter/material.dart';
import 'package:grantconsent/screens/loader.dart';
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
  Future _signUp(BuildContext context) async {
    if (inputPassword.text != confirmPassword.text) {
      //If password do not match
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Password fields do not match.'),
      );
    } else if (inputName.text == "") {
      //If name is empty
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Name cannot be empty'),
      );
    } else if (inputPhoneNumber.text.length < 11) {
      //If phone number is invalid
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(message: 'Wrong Phone Number'),
      );
    } else {
      //if input data is valid
      showDialog(context: context, builder: (context) => Loader());
      ConsentUser newUser = ConsentUser(
          name: inputName.text,
          email: inputEmail.text,
          phoneNumber: inputPhoneNumber.text);
      SignUpStatus operationStatus =
          await signUpUser(newUser: newUser, password: inputPassword.text);
      Navigator.pop(context);
      if (operationStatus == SignUpStatus.success) {
        // If sign up was successfull
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
      } else
        _handleExceptions(operationStatus); //If sign up was NOT successful
    }
  }

  void _handleExceptions(SignUpStatus operationStatus) {
    if (operationStatus == SignUpStatus.weakPassword) {
      //If sign up was NOT successful - PASSWORD IS WEAK
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(
            message: 'Password must be at least six (6) characters long',
            durationInSeconds: 3),
      );
    } else if (operationStatus == SignUpStatus.invalidEmail) {
      //If sign up was NOT successful - INVALID EMAIL ENTERED
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(
            message:
                'The email address you entered is invalid. Please check and try again',
            durationInSeconds: 3),
      );
    } else if (operationStatus == SignUpStatus.userExists) {
      //If sign up was NOT successful - USER ALREADY EXISTS
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(
            message: 'This email address is tied to another user account',
            durationInSeconds: 3),
      );
    } else if (operationStatus == SignUpStatus.unknownException) {
      //If sign up was NOT successful - UNKNOWN ERROR OCCURED
      scaffoldKey.currentState.showSnackBar(
        customSnackBar(
            message: 'An unknown error occured. Try again',
            durationInSeconds: 3),
      );
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
