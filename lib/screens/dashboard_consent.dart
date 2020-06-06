import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/styles.dart';

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
                  Tab(text: "In Progress"),
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
