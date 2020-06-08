import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grantconsent/services/send_through_email.dart';
import 'package:grantconsent/services/send_through_whatsapp.dart';
import 'package:grantconsent/services/dynamic_links_services.dart';

class SendConsent extends StatefulWidget {
  @override
  _SendConsentState createState() => _SendConsentState();
}

class _SendConsentState extends State<SendConsent> {
  String user = 'Celine';

  String myMail;

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
                  'If $user does not accept the consent,\nyou should not touch them.\nThat would be RAPE',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 3,
                ),
                Builder(
                  builder: (context) => TextField(
                    onChanged: (String email) {
                      setState(() {
                        myMail = email;
                      });
                      print(myMail);
                    },
                    onEditingComplete: () async {
                      String link =
                          await DynamicLinksService().createDynamicLinks(user);
                      await sendConsentViaEmail(myMail, link);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Message Sent'),
                        behavior: SnackBarBehavior.floating,
                      ));
                      setState(() {
                        TextEditingController().text = '';
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.send,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.mail_outline,
                        size: 16,
                      ),
                      filled: true,
                      fillColor: kButtonColor.withOpacity(0.3),
                      contentPadding: EdgeInsets.all(8),
                      labelText: '$user\'s Email',
                      labelStyle: kBody1TextStyle.copyWith(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                  ),
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
                  onPressed: () async {
                    String link =
                        await DynamicLinksService().createDynamicLinks(user);
                    LocalContact selectedContact = await pickAContact();
                    if (selectedContact != null)
                      sendConsentViaWhatsapp(
                          phoneNumber: selectedContact.phoneNumber[0],
                          link: link);
                    else
                      return;
                  },
                  label: '$user\'s Whatsapp contact',
                  icon: FontAwesomeIcons.whatsapp,
                  iconColor: Colors.green,
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
    this.iconColor = Colors.black,
  });

  final String label;
  final IconData icon;
  final Function onPressed;
  final Color iconColor;

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
              color: iconColor,
            )
          ],
        ),
      ),
    );
  }
}
