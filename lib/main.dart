import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/screens/Create_a_consent.dart';
import 'package:grantconsent/screens/loading_animation.dart';
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
<<<<<<< HEAD
          scaffoldBackgroundColor: kBackgroundColor,
          accentColor: kButtonColor,
          primaryColor: kButtonColor,
          ),
      home: CreateConsent(),
=======
        scaffoldBackgroundColor: kBackgroundColor,
        accentColor: kButtonColor,
        primaryColor: kButtonColor,
      ),
      routes: {
        '/': (context) => LoadingAnimation(),
        '/request': (context) => SignUp(),
        '/getstarted': (context) => GetStarted(),
      },
      initialRoute: '/',
>>>>>>> 00fd5f5fbd14fb0e46ec4c4427f2b458eb0e4444
      debugShowCheckedModeBanner: false,
    );
  }
}
