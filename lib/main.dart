import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/Create_a_consent.dart';
import 'package:grantconsent/screens/loading_animation.dart';
import 'utilities/styles.dart';

void main() {
  runApp(GrantConsent());

}

class GrantConsent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

    return MaterialApp(
      title: 'Grant Consent',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          accentColor: kButtonColor,
          primaryColor: kButtonColor,
          ),
      home: CreateConsent(),
      debugShowCheckedModeBanner: false,
    );
  }
}
