import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/services/send_through_whatsapp.dart';

//Use this screen to test your features and stuff.

class TestInterface extends StatefulWidget {
  @override
  _TestInterfaceState createState() => _TestInterfaceState();
}

class _TestInterfaceState extends State<TestInterface> {
  String data1, data2, data3;
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
            data3 = selectedContact.phoneNumber.toString();
          });
        })
      ],
    ));
  }
}
