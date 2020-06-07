import 'package:flutter/material.dart';
import 'package:grantconsent/screens/terms_and_conditions_two.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';

import 'about_screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 17, 17, 0),
      child: Column(
        children: <Widget>[
          ProfileTabsWidget(
            image: Image.asset(
              'assets/notificationsbell.png',
              height: 100,
            ),
            //        icon: Icons.chevron_right,
            label: 'Notifications',
          ),
          ProfileTabsWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermAndConditions(),
                  ));
            },
            image: Image.asset(
              'assets/Consent.png',
              height: 20,
            ),
            // icon: Icons.chevron_right,
            label: 'Terms and Conditions',
          ),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/Consent.png',
              height: 20,
            ),
            // icon: Icons.chevron_right,
            label: 'Consent Agreement Template',
          ),
          ProfileTabsWidget(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ));
            },
            image: Image.asset(
              'assets/Subtract.png',
              height: 20,
            ),
            // icon: Icons.chevron_right,
            label: 'About Grant Consent',
          ),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/log-out.png',
              height: 20,
            ),
            label: 'Log Out',
          ),
        ],
      ),
    );
  }
}
