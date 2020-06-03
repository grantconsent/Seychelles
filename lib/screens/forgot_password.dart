import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/services/firebase_forgot_password.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/screens/loader.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController inputEmail = TextEditingController();
  final scaffoldKey1 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey1,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: kGetStartedScreenBackground,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(34, 34, 34, 0.2), BlendMode.overlay),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 9,
              ),
              Text(
                'Forgot',
                style: kWelcomeHeadingTextStyle,
              ),
              Text(
                'Password',
                style: kWelcomeHeadingTextStyle,
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                'Enter email address below to retrieve your password.',
                style: kBody1TextStyle.copyWith(color: Colors.white),
              ),
              Spacer(
                flex: 2,
              ),
              CustomTextFormField(
                controller: inputEmail,
                hintText: "Email Address",
                textInputType: TextInputType.emailAddress,
              ),
              Spacer(
                flex: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: UserActionButton(
                  onTap: () {
                    _forgotIn(context);
                  },
                  label: 'Retrieve Password',
                  filled: true,
                ),
              ),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _forgotIn(BuildContext context) async {
    showDialog(context: context, builder: (context) => Loader());
    ForgotStatus operationStatus = await forgotPassword(inputEmail.text);
    Navigator.pop(context);
    if (operationStatus == ForgotStatus.success) {
      //Reset works
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: <Widget>[
                  AppIconButton(onTap: () {
                    Navigator.pop(context);
                  })
                ],
                title: Text(
                  'Check your Email',
                  style: kWelcomeHeadingTextStyle,
                ),
                content: Container(
                    child: Text(
                        'A password reset link has been sent to your email.\nFollow the link to change your password.')),
              ));
    } else if (operationStatus == ForgotStatus.incorrect) {
      // Email not in database
      scaffoldKey1.currentState.showSnackBar(
        customSnackBar(message: 'Invalid Email Address'),
      );
    } else if (operationStatus == ForgotStatus.invalid) {
      // Email not in database
      scaffoldKey1.currentState.showSnackBar(
        customSnackBar(
            message: 'No user with this email address. Please try again'),
      );
    } else if (operationStatus == ForgotStatus.internal) {
      // Doesn't work at all
      scaffoldKey1.currentState.showSnackBar(
        customSnackBar(message: 'Internal Server Error'),
      );
    }
  }
}
