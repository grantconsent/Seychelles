import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/about_screen.dart';
import 'package:grantconsent/screens/loading_animation.dart';
import 'package:grantconsent/screens/terms_and_conditions.dart';
import 'package:grantconsent/screens/terms_and_conditions_two.dart';
import 'package:grantconsent/services/dynamic_links_services.dart';
import 'utilities/styles.dart';
import 'screens/sign_up.dart';
import 'screens/get_started_screen.dart';
void main() {
  runApp(GrantConsent());
}

class GrantConsent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    DynamicLinksService dynamicLinksService = DynamicLinksService();
    dynamicLinksService.handleDynamicLinks();
    return MaterialApp(
      title: 'Grant Consent',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        accentColor: kButtonColor,
        primaryColor: kButtonColor,
      ),
      routes: {
        '/': (context) => TermsTwo(),
        '/request': (context) => SignUp(),
        '/getstarted': (context) => GetStarted(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
