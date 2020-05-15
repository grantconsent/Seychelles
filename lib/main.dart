import 'package:flutter/material.dart';
import 'package:grantconsent/screens/splash_screen.dart';
<<<<<<< HEAD
import 'package:grantconsent/screens/authentication/sign_in.dart';
=======
import 'package:grantconsent/screens/sign_in.dart';
>>>>>>> 7af447b606c93b331ced3e91605fd4fb36f544f3

void main() {
  runApp(GrantConsent());
}

class GrantConsent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grant Consent',
      theme: ThemeData(
<<<<<<< HEAD
          //   primarySwatch: Colors.white,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      routes: {
        '/': (context) => SplashScreen(),
        '/sign_in': (context) => SignIn()
      },
=======
        //   primarySwatch: Colors.white, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
>>>>>>> 7af447b606c93b331ced3e91605fd4fb36f544f3
    );
  }
}
