import 'package:firebase_auth/firebase_auth.dart';

Future forgotPassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //TODO: Try and catch exceptions. Return status based on exceptions or success.
  return _auth.sendPasswordResetEmail(email: email);
}