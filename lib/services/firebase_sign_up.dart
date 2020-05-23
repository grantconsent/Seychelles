import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

Future<SignUpStatus> signUpUser(
    {@required ConsentUser newUser, @required String password}) async {
  final _auth = FirebaseAuth.instance;
  try {
    final result = await _auth.createUserWithEmailAndPassword(
        email: newUser.email, password: password);
    if (result != null) {
      sendVerificationEmail();

      //TODO: Insert firebase add for Users Collection
      print('Worked!');
      return SignUpStatus.success;
    } else{print('Failed!');}
  } catch (e) {
    print(e);
    return e.toString().contains('WEAK')
        ? SignUpStatus.weakPassword
        : e.toString().contains('INVALID_EMAIL')
            ? SignUpStatus.invalidEmail
            : e.toString().contains('ALREADY_IN_USE')
                ? SignUpStatus.userExists
                : SignUpStatus.unknownException;
  }
}

Future sendVerificationEmail() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseUser user = await _auth.currentUser();
  try {
    user.sendEmailVerification();
    print('email sent');
  } catch (e) {
    print(e);
  }
}

enum SignUpStatus {
  success,
  weakPassword,
  invalidEmail,
  userExists,
  unknownException,
}
