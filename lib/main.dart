import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/dashboard.dart';
import 'package:grantconsent/screens/loading_animation.dart';
//import 'package:grantconsent/screens/loading_animation.dart';
import 'screens/terms_and_conditions.dart';
import 'utilities/constants.dart';
import 'utilities/styles.dart';
//import 'package:grantconsent/screens/splash_screen.dart';

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
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
