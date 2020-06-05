import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
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
                    onPressed: () {},
                    child: Text(
                      "Edit Profile",
                      style: kEditProfileTextStyle,
                    ),
                    color: kDashboardBackgroundColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xffCAB480),
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
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
          Timer(Duration(milliseconds: 200), () {
            setState(() {
              profileBodyVisible = true;
            });
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: index == 2 ? MainAxisAlignment.end  : index == 0 ?  MainAxisAlignment.start: MainAxisAlignment.center,
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
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}

class Consent extends StatefulWidget {
  @override
  _ConsentState createState() => _ConsentState();
}

class _ConsentState extends State<Consent> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3);
    _controller.addListener(() {
      setState(() {
        if (_controller.index == 0) {
          indicatorColor = Colors.white;
        } else if (_controller.index == 1) {
          indicatorColor = Colors.red;
        } else if (_controller.index == 2) {
          indicatorColor = Colors.green;
        }
      });
    });
  }

  Color indicatorColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your\nConsent",
                  style: kWelcomeDashboardTextStyle,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                controller: _controller,
                labelStyle: kConsentTabTextStyle,
                indicatorColor: indicatorColor,
                tabs: <Widget>[
                  Tab(
                    text: "In Progress",
                  ),
                  Tab(text: "Rejected"),
                  Tab(text: "Accepted"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.all(12.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Bami agree to consent",
                                  style: kDashboardOptionTextStyle),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.all(12.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Rejected Consent",
                                  style: kDashboardOptionTextStyle),
                              Icon(
                                Icons.info_outline,
                                color: Colors.red[700],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.4),
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          padding: EdgeInsets.all(12.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Accepted Consent",
                                  style: kDashboardOptionTextStyle),
                              Icon(
                                Icons.info_outline,
                                color: Colors.green[700],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.4),
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
