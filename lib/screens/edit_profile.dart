import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/styles.dart';

class EditProfile extends StatelessWidget {
  // bool profileVisible = false;
  // bool profileBodyVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kDashboardBackgroundColor,
      // body: SafeArea(
      //   child: Column(
      //     children: <Widget>[
      //       AnimatedContainer(
      //         duration: Duration(milliseconds: 200),
      //         padding: EdgeInsets.all(5),
      //         height: profileVisible ? 230 : 60,
      //         child: Column(
      //           children: <Widget>[
      //             Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: <Widget>[
      //                 SizedBox(width: 20),
      //                 Text('Edit Profile', style: kDashboardHeaderTextStyle),
      //                 Spacer(),
      //                 Opacity(
      //                   opacity: profileVisible ? 0 : 1,
      //                   child: Image.asset(
      //                     "assets/cam.png",
      //                     width: 50,
      //                     height: 50,
      //                   ),
      //                 )
      //               ],
      //             ),
      //             Visibility(
      //               visible: profileBodyVisible,
      //               child: Column(
      //                 children: <Widget>[
      //                   Image.asset(
      //                     "assets/cam.png",
      //                     height: 60,
      //                     width: 60,
      //                   ),
      //                   Text(
      //                     loggedInUser.fullName,
      //                     style: kDashboardLoggedInNameTextStyle,
      //                   ),
      //                   SizedBox(height: 4),
      //                   Text(
      //                     loggedInUser.email,
      //                     style: kDashboardLoggedInEmailTextStyle,
      //                   ),
      //                   SizedBox(height: 4),
      //                   RaisedButton(
      //                     padding: EdgeInsets.zero,
      //                     onPressed: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => EditProfile(),
      //                         ),
      //                       );
      //                     },
      //                     child: Text("Edit Profile"),
      //                     color: Color(0xffCAB480),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //         decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey,
      //             blurRadius: 0.02,
      //             spreadRadius: 0.02,
      //             offset: Offset(0, 1.5),
      //           ),
      //         ]),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
