import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grantconsent/screens/Create_a_consent.dart';
import 'package:grantconsent/screens/send_consent.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class ConsentScreen1 extends StatelessWidget {
  static final _random = new Random();
  final welcomeText =
      dynamicWelcomeText[_random.nextInt(dynamicWelcomeText.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardBackgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: kToolbarHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(width: 20),
                  Text(
                    'Create consent',
                    style: kDashboardHeaderTextStyle,
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/cam.png",
                    width: 41,
                    height: 41,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
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
                  ],
                ),
              ),
              Text(
                "You're about to request consent from:",
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 45,
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Partner's Name",
                      labelStyle: kInputTextStyle.copyWith(
                        fontSize: 15,
                        color: Color.fromRGBO(202, 180, 128, 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(202, 180, 128, 0.2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 180, 128, 0.5),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('When will this be:'),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 45,
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Date and Tme",
                      labelStyle: kInputTextStyle.copyWith(
                        fontSize: 15,
                        color: Color.fromRGBO(202, 180, 128, 0.5),
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(202, 180, 128, 0.2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 180, 128, 0.5),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 1),
                constraints: BoxConstraints.tightFor(
                    width: kScreenSize.width, height: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(35, 35, 35, 0.1),
                ),
                child: RawMaterialButton(
                  padding: EdgeInsets.only(left: 40, right: 14.4),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendConsent(), //CreateConsent(),
                      ),
                    );
                  },
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Continue",
                      ),
                      Icon(
                        Icons.chevron_right,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
