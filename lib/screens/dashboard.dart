import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/dashboard_profile.dart';
import 'package:grantconsent/screens/edit_profile.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/dashboard_consent.dart';
import 'package:grantconsent/screens/dashboard_home.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/styles.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

//left-> left: 0
//middle -> left: MediaQuery.of(context).size.width / 2.8
//right-> right: MediaQuery.of(context).size.width - 120

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: kDashboardBackgroundColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[header(), SizedBox(height: 2), body(), bottom()],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?',
                style: kBody1TextStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.black87)),
            content:
                new Text('Do you want to exit the App?', style: kBody1TextStyle.copyWith(color: Colors.black87)),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("NO", style: kDashboardFooterTextStyle.copyWith(color: Colors.black87)),
              ),
              SizedBox(height: 16),
              new FlatButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: Text("YES",style: kDashboardFooterTextStyle.copyWith(color: Colors.black87)),
              ),
            ],
          ),
        ) ??
        false;
  }

  String getHeaderText() {
    if (indicatorAlignment == Alignment.centerLeft) {
      return "Dashboard";
    } else if (indicatorAlignment == Alignment.center) {
      return "Consent";
    }
    return "Profile";
  }

  bool profileVisible = false;
  bool profileBodyVisible = false;

  Widget header() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.all(5),
      height: profileVisible ? 280 : 60,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 20),
              Text(getHeaderText(), style: kDashboardHeaderTextStyle),
              Spacer(),
              Opacity(
                opacity: profileVisible ? 0 : 1,
                child: Image.asset(
                  "assets/cam.png",
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          Visibility(
            visible: profileBodyVisible,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/cam.png",
                  height: 100,
                  width: 100,
                ),
                Text(
                  loggedInUser.fullName,
                  style: kDashboardLoggedInNameTextStyle,
                ),
                SizedBox(height: 4),
                Text(
                  loggedInUser.email,
                  style: kDashboardLoggedInEmailTextStyle,
                ),
                SizedBox(height: 13),
                SizedBox(
                  height: 30,
                  child: RaisedButton(
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      "Edit Profile",
                      style: kEditProfileTextStyle,
                    ),
                    color: kDashboardBackgroundColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffCAB480), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: indicatorAlignment == Alignment.centerRight
            ? Colors.white
            : kDashboardBackgroundColor,
        boxShadow: indicatorAlignment == Alignment.centerRight
            ? [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.02,
                  spreadRadius: 0.02,
                  offset: Offset(0, 1.5),
                ),
              ]
            : [],
      ),
    );
  }

  Widget body() {
    return Expanded(
      child: Container(
        color: kDashboardBackgroundColor,
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    if (indicatorAlignment == Alignment.centerLeft) {
      return Padding(
        child: Home(),
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 25,
        ),
      );
    } else if (indicatorAlignment == Alignment.center) {
      return Consent();
    }
    return Profile();
  }

  Widget bottom() {
    final Radius radius = Radius.circular(6);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xff222222),
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              padding: EdgeInsets.all(0),
              child: Opacity(
                opacity: 0,
                child: bottomNavItem(100),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.transparent),
              ),
            ),
          ),
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                Expanded(child: bottomNavItem(0)),
                Expanded(child: bottomNavItem(1)),
                Expanded(child: bottomNavItem(2)),
              ],
            ),
          ),
          AnimatedAlign(
            alignment: indicatorAlignment,
            duration: Duration(milliseconds: 200),
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 2),
              width: 94,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Color(0xffCAB480)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Alignment indicatorAlignment = Alignment.centerLeft;

  Widget bottomNavItem(int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          setState(() {
            indicatorAlignment = Alignment.centerLeft;
            profileVisible = false;
            profileBodyVisible = false;
            //rightValue = null;
            //leftValue = 0;
          });
        } else if (index == 1) {
          setState(() {
            indicatorAlignment = Alignment.center;
            profileVisible = false;
            profileBodyVisible = false;
            // leftValue = MediaQuery.of(context).size.width / 2.8;
            //rightValue = null;
          });
        } else if (index == 2) {
          setState(() {
            indicatorAlignment = Alignment.centerRight;
            profileVisible = true;
//            rightValue = 0;
//            leftValue = null;
          });
          Timer(Duration(milliseconds: 100), () {
            setState(() {
              profileBodyVisible = true;
            });
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: index == 2
              ? MainAxisAlignment.end
              : index == 0 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 7),
            Image.asset(
              getUrl(index),
              height: 20,
            ),
            SizedBox(width: 5),
            Text(
              getText(index),
              style: kDashboardFooterTextStyle,
            ),
            SizedBox(width: 7),
          ],
        ),
      ),
    );
  }

  String getUrl(int index) {
    String url;
    print(index);
    switch (index) {
      case 0:
        url = "assets/Home.png";
        break;
      case 1:
        url = "assets/small_consent.png";
        break;
      case 2:
        url = "assets/profile.png";
        break;
      default:
        url = "assets/small_consent.png";
        break;
    }
    return url;
  }

  String getText(int index) {
    String text;
    switch (index) {
      case 0:
        text = "Home";
        break;
      case 1:
        text = "Consent";
        break;
      case 2:
        text = "Profile";
        break;
      default:
        text = "Profile";
        break;
    }
    return text;
  }
}
