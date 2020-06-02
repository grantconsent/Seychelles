import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/dashboard.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';

class SendConsent extends StatelessWidget {
  final String user = 'Celine';

  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDashboardBackgroundColor,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
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
                Spacer(
                  flex: 2,
                ),
                Text(
                  'Send your consent request to',
                  style: kBody1TextStyle.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text(
                  user,
                  style: kDashboardHeaderTextStyle.copyWith(fontSize: 20),
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  'This consent is NOT valid until $user \naccepts it',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '$user is free to reject this consent',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'If $user does not accept the consent,\nyou should not touch them, except \nyou’re a rapist and we will find you \nand RAPE you.',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                UserSendButton(
                  label: '$user\'s Email address',
                  onPressed: () {},
                  icon: Icons.mail_outline,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  'or',
                  textAlign: TextAlign.center,
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                UserSendButton(
                  onPressed: () {},
                  label: '$user\'s Whatsapp contact',
                  icon: Icons.call,
                ),
                Spacer(
                  flex: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserSendButton extends StatelessWidget {
  const UserSendButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.icon,
  });

  final String label;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      constraints:
          BoxConstraints.tightFor(width: kScreenSize.width, height: 50),
      decoration: BoxDecoration(
          color: kButtonColor.withOpacity(0.3),
          border: Border.all(color: kButtonColor),
          borderRadius: BorderRadius.circular(3)),
      child: RawMaterialButton(
        padding: EdgeInsets.only(left: 20, right: 14.4),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style:
                  kBody1TextStyle.copyWith(color: Colors.black, fontSize: 14),
            ),
            Icon(
              icon,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
