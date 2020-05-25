import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/styles.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

//left-> left: 0
//middle -> left: MediaQuery.of(context).size.width / 2.8
//right-> right: MediaQuery.of(context).size.width - 120

class _DashboardState extends State<Dashboard> {
  double leftValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[header(), SizedBox(height: 2), body(), bottom()],
        ),
      ),
    );
  }

  String getHeaderText() {
    if (leftValue == 0) {
      return "Dashboard";
    } else if (leftValue == MediaQuery.of(context).size.width / 2.8) {
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
              Text(getHeaderText()),
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
                  "Bami Ogunfemi",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  "ogunfemiayobami@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffCAB480),
                  ),
                ),
                SizedBox(height: 4),
                RaisedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
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
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        color: kDashboardBackgroundColor,
        child: getBody(),
      ),
    );
  }

  Widget getBody() {
    if (leftValue == 0) {
      return Home();
    } else if (leftValue == MediaQuery.of(context).size.width / 2.8) {
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
          AnimatedPositioned(
            left: leftValue,
            duration: Duration(milliseconds: 150),
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 2),
              child: Opacity(
                opacity: 0,
                child: bottomNavItem(100),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xffCAB480)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavItem(int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          setState(() {
            leftValue = 0;
            profileVisible = false;
            profileBodyVisible = false;
          });
        } else if (index == 1) {
          setState(() {
            leftValue = MediaQuery.of(context).size.width / 2.8;
            profileVisible = false;
            profileBodyVisible = false;
          });
        } else if (index == 2) {
          setState(() {
            leftValue = MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width - 292);
            profileVisible = true;
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
            Image.asset(getUrl(index)),
            SizedBox(width: 5),
            Text(
              getText(index),
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(width: 1),
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
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Hi, Bami",
            style: TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Can we have dynamic texts here\nand here also",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
              Text("Create Consent"),
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Review a consent"),
              Icon(
                Icons.info_outline,
                color: Colors.black,
              )
            ],
          ),
        ),
      ],
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
    return Container();
  }
}
