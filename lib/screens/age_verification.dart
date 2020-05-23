import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';
class AgeVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
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
              Text('Verification',
              style: kBody1TextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Text('Age',
              style: kWelcomeHeadingTextStyle,),
              Text('verification',
                style: kWelcomeHeadingTextStyle,),
              Spacer(
                flex: 2,
              ),
              Text('You attest that you are above eighteen (+18) years of age.',
                style: kBody1TextStyle.copyWith(
                  color: Colors.white
                ),),
              Spacer(
                flex: 17,
              ),
              Center(
                child: Text('See terms and conditions',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: UserActionButton(
                  onTap: (){},
                  label: 'Agree and Continue',
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
}
