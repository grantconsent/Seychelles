import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/loading_animation.dart';
import 'utilities/styles.dart';
import 'screens/sign_up.dart';
import 'screens/get_started_screen.dart';
import 'screens/dynamic_link_test.dart';
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
      routes: {
        '/' : (context) => DynamicLinkTest(),
        '/request' : (context) => SignUp(),
        '/getstarted' : (context) => GetStarted(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
