import 'dart:math';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/Create_a_consent.dart';
import 'package:grantconsent/screens/review_consent_screen.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/styles.dart';

class Home extends StatelessWidget {
  static final _random = new Random();
  final welcomeText =
      dynamicWelcomeText[_random.nextInt(dynamicWelcomeText.length)];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Hi, ${loggedInUser.firstName}",
            style: kWelcomeDashboardTextStyle,
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            welcomeText,
            style: kDashboardDynamicTextStyle,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                "assets/GIFs/peep.gif",
                width: double.maxFinite,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: RawMaterialButton(
            padding: EdgeInsets.all(12.3),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateConsent(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Create Consent", style: kDashboardOptionTextStyle),
                Icon(
                  Icons.add,
                  color: Colors.black,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color(0xff222222).withOpacity(0.4),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: RawMaterialButton(
            padding: EdgeInsets.all(12.3),
            onPressed: () {
              print('Oh well. ');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Review a consent", style: kDashboardOptionTextStyle),
                Icon(
                  Icons.info_outline,
                  color: Colors.black,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff222222).withOpacity(0.4),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
