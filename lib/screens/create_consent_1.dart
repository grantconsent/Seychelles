import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grantconsent/screens/Create_a_consent.dart';
import 'package:grantconsent/screens/send_consent.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class ConsentScreen1 extends StatefulWidget {
  static final _random = new Random();

  @override
  _ConsentScreen1State createState() => _ConsentScreen1State();
}

class _ConsentScreen1State extends State<ConsentScreen1> {
  String _date;
  String _time;

  final welcomeText = dynamicWelcomeText[
      ConsentScreen1._random.nextInt(dynamicWelcomeText.length)];

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(202, 180, 128, 0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SizedBox(
                  height: 45,
                  child: TextFormField(
                    enableSuggestions: true,
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      hintText: "Enter Partner's Name",
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
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
                child: InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    ).then(
                      (date) {
                        setState(
                          () {
                            _date = DateFormat("EEEE, MMMM d y").format(date);
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(202, 180, 128, 0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(children: <Widget>[
                      Text(
                        _date == null ? 'Select Date' : _date,
                      ),
                      Spacer(),
                      Icon(Icons.calendar_today),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 45,
                child: InkWell(
                  onTap: () {
                    

                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then(
                      (time) {
                        setState(
                          () {
                            _time = MaterialLocalizations.of(context).formatTimeOfDay(time);
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(202, 180, 128, 0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(children: <Widget>[
                      Text(
                        _time == null ? 'Select Time' : _time,
                      ),
                      Spacer(),
                      Icon(Icons.access_time),
                    ]),
                  ),
                ),
              ),
              Spacer(),
              Container(
                constraints: BoxConstraints.tightFor(
                    width: kScreenSize.width, height: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(35, 35, 35, 0.1),
                ),
                child: RawMaterialButton(
                  padding: EdgeInsets.only(left: 40, right: 14.4),
                  onPressed: () {
                    Navigator.pushReplacement(
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
