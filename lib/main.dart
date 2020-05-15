import 'package:flutter/material.dart';
import 'package:grantconsent/screens/splash_screen.dart';
import 'package:grantconsent/screens/authentication/sign_in.dart';

void main() {
  runApp(GrantConsent());
}

class GrantConsent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grant Consent',
      theme: ThemeData(

          //   primarySwatch: Colors.white,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      routes: {
        '/': (context) => SplashScreen(),
        '/sign_in': (context) => SignIn()
      },
    );
  }
}
