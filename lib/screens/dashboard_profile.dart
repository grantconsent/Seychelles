import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 17),
          ProfileTabsWidget(
            image: Image.asset(
              'assets/notificationsbell.png',
              height: 100,
            ),
            icon: Icons.chevron_right,
            label: 'Notifications',
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
            label: 'Consent Agreement Template',
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
