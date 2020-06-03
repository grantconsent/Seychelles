import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_sign_out.dart';

Future<SignUpStatus> signUpUser(
    {@required ConsentUser newUser, @required String password}) async {
  signOutUser();
  final _auth = FirebaseAuth.instance;
  try {
    final result = await _auth.createUserWithEmailAndPassword(
        email: newUser.email, password: password);
    if (result != null) {
      sendVerificationEmail();
      saveNewUserData(newUser);
      return SignUpStatus.success;
    } else {
      print('Failed!');
    }
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
  return SignUpStatus.unknownException;
}


Future sendVerificationEmail() async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseUser user = await _auth.currentUser();
  try {
    user.sendEmailVerification();
  } catch (e) {
    //TODO: take action to handle sending email failure.
    print(e);
  }
}

void saveNewUserData(ConsentUser user) async{

  final firebaseUser = await FirebaseAuth.instance.currentUser();
  final _seychellesFirestore = Firestore.instance;
  _seychellesFirestore.collection("Users").document(firebaseUser.uid).setData({
    'FirstName': user.firstName,
      'LastName': user.lastName,
    'PhoneNumber': user.phoneNumber,
    'Email': user.email,
  });
  return;
}

enum SignUpStatus {
  success,
  weakPassword,
  invalidEmail,
  userExists,
  unknownException,
}
enum EmailStatus {
  emailSent,
  emailFailed,
}
