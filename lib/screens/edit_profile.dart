import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/get_user_picture.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/styles.dart';

class EditProfile extends StatelessWidget {
  bool profileBodyVisible = true;
  bool profileVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.all(5),
              height: profileVisible ? 230 : 60,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: profileBodyVisible,
                    child: Column(
                      children: <Widget>[
                        InkResponse(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetUserPicture()));
                          },
                          child: loggedInUser.pictureURL == null
                              ? Image(
                                  height: 100,
                                  width: 100,
                                  image: AssetImage(
                                    "assets/cam.png",
                                  ))
                              : CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(loggedInUser.pictureURL),
                                  radius: 50,
                                ),
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
            ),
            SizedBox(height: 0.5),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Coming soon',
                    style: kWelcomeHeadingTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
