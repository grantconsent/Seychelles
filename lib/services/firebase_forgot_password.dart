import 'package:firebase_auth/firebase_auth.dart';

Future forgotPassword(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  //TODO: Try and catch exceptions. Return status based on exceptions or success.
  try {
    await _auth.sendPasswordResetEmail(email: email);
    print('working');
    return ForgotStatus.success;
  } catch (e) {
    print(e);
    return e.toString().contains('ERROR_USER_NOT_FOUND')
        ? ForgotStatus.invalid
        : ForgotStatus.internal;
  }
}

enum ForgotStatus {
  success,
  invalid,
  internal,
}
