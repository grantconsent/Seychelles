import 'package:flutter/material.dart';
import 'package:grantconsent/services/send_through_email.dart';
import 'package:grantconsent/services/send_through_whatsapp.dart';
import 'package:grantconsent/utilities/styles.dart';

//Use this screen to test your features and stuff.

class TestInterface extends StatefulWidget {
  @override
  _TestInterfaceState createState() => _TestInterfaceState();
}

class _TestInterfaceState extends State<TestInterface> {
  String data1, data2, data3;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          data1 ?? 'null',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Text(
          data2 ?? 'null',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        Text(
          data3 ?? 'null',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        RaisedButton(onPressed: () async {
          LocalContact selectedContact = await pickAContact();
          if (selectedContact != null)
            sendConsentViaWhatsapp(
                phoneNumber: selectedContact.phoneNumber[0],
                link: 'you link input to the function');
          else
            return;

          setState(() {
            data1 = selectedContact.name;
            //  data2 = selectedContact.emailAddress;
            data2 = selectedContact.phoneNumber.toString();
          });
        }),
        SizedBox(height: 20),
        TextField(
        textInputAction: TextInputAction.send,
          keyboardType: TextInputType.emailAddress,
          style: kBody1TextStyle,
        
          decoration: InputDecoration(

            helperText: 'Enter your email address',
            hintText: 'Email Address',
            hintStyle: kBody1TextStyle,
            helperStyle: kBody1TextStyle.copyWith(fontSize: 11),
          ),
          controller: emailController,
        ),
        RaisedButton(onPressed: () async {
          setState(() {
            data3 = "- - - -";
          });
          MailStatus status =
              await sendConsentViaEmail(emailController.text, '1234567');
          setState(() {
            if (status == MailStatus.success)
              data3 = 'Sent';
            else
              data3 = 'Failed to send';
          });
        })
      ],
    ));
  }
}