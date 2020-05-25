import 'package:firebase_auth/firebase_auth.dart';

Future forgotPassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  return _auth.sendPasswordResetEmail(email: email);
}