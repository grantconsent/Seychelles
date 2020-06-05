import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/edit_profile.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:grantconsent/utilities/constants.dart';
import "dart:math";

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
                style: kBody1TextStyle.copyWith(fontWeight: FontWeight.bold)),
            content:
                new Text('Do you want to exit the App', style: kBody1TextStyle),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new FlatButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: Text("YES"),
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
      height: profileVisible ? 230 : 60,
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
                  height: 60,
                  width: 60,
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
                SizedBox(height: 4),
                RaisedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                  child: Text("Edit Profile"),
                  color: Color(0xffCAB480),
                ),
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 0.02,
          spreadRadius: 0.02,
          offset: Offset(0, 1.5),
        ),
      ]),
    );
  }

  Widget body() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        color: kDashboardBackgroundColor,
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    if (indicatorAlignment == Alignment.centerLeft) {
      return Home();
    } else if (indicatorAlignment == Alignment.center) {
      return Consent();
    }
    return Profile();
  }

  Widget bottom() {
    final Radius radius = Radius.circular(6);
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Color(0xff222222),
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              padding: EdgeInsets.all(5),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 6,
                ),
                bottomNavItem(0),
                Spacer(),
                bottomNavItem(1),
                Spacer(),
                bottomNavItem(2),
                SizedBox(
                  width: 8,
                ),
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
          Timer(Duration(milliseconds: 200), () {
            setState(() {
              profileBodyVisible = true;
            });
          });
        }
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class Home extends StatelessWidget {
  static final _random = new Random();
  final welcomeText =
      dynamicWelcomeText[_random.nextInt(dynamicWelcomeText.length)];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
          SizedBox(height: 10),
          Expanded(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding: EdgeInsets.all(1),
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
            padding: EdgeInsets.all(12.3),
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
            decoration: BoxDecoration(
                color: Color(0xff222222).withOpacity(0.4),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),

          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(12.3),
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
            decoration: BoxDecoration(
              color: Color(0xff222222).withOpacity(0.4),
              border: Border.all(color: Colors.black),

              borderRadius: BorderRadius.circular(5)),
        
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(12.3),
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
          decoration: BoxDecoration(
            color: Color(0xff222222).withOpacity(0.4),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),

          ),
        ],
      ),
    );
  }
}

class Consent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ProfileTabsWidget(
            image: Image.asset(
              'assets/notificationsbell.png',
              height: 100,
            ),
            icon: Icons.chevron_right,
            label: 'Notification',
          ),
          SizedBox(height: 5),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/Consent.png',
              height: 20,
            ),
            icon: Icons.chevron_right,
            label: 'Terms and Conditions',
          ),
          SizedBox(height: 5),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/Consent.png',
              height: 20,
            ),
            icon: Icons.chevron_right,
            label: 'Privacy Policy',
          ),
          SizedBox(height: 5),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/Subtract.png',
              height: 20,
            ),
            icon: Icons.chevron_right,
            label: 'About Grant Consent',
          ),
          SizedBox(height: 5),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/log-out.png',
              height: 20,
            ),
            label: 'Log Out',
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
