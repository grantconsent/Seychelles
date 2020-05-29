 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/services/dynamic_links_services.dart';

class DynamicLinkTest extends StatefulWidget {
  @override
  _DynamicLinkTestState createState() => _DynamicLinkTestState();
}

class _DynamicLinkTestState extends State<DynamicLinkTest> {
   DynamicLinksService dynamicLinksService = DynamicLinksService();
   String myLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             RaisedButton(
               onPressed: ()async{
                 //YOU CAN CHANGE THE 'getstarted' to another route on main.dart
                 await dynamicLinksService.createDynamicLinks('getstarted');
                 setState(() {
                  myLink = dynamicLinksService.myLink;
                 });
               },
               child: Text('Get Deep Link'),
             ),
             SizedBox(
               height: 20,
             ),

             InkWell(
               onLongPress: (){
                 Clipboard.setData(ClipboardData(text: myLink));
               },
               child: Text(myLink?? 'Click to get Link',
               style: TextStyle(
                 color: Colors.white,
               ),),)
           ],
          ),
        ),
      ),
    );
  }
}
