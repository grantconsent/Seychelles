import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

Future signInUser({ConsentUserSignIn newUser, String password}) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    final result = await _auth.signInWithEmailAndPassword(
        email: newUser.email, password: password);
    if (result != null) {
      final user = await _auth.currentUser();
      if (user.isEmailVerified) {
  //      print('Worked!');
        return SignInStatus.success;
      } else
        return SignInStatus.emailUnverified;
    } else {
  //    print('Failed!');
    }
  } catch (e) {
    print(e);
    return e.toString().contains('ERROR_INVALID_EMAIL')
        ? SignInStatus.invalidEmail
        : e.toString().contains('ERROR_USER_NOT_FOUND')
            ? SignInStatus.userNotFound
            : e.toString().contains('ERROR_WRONG_PASSWORD')
                ? SignInStatus.wrongPassword
                : SignInStatus.unknownException;
  }
}

enum SignInStatus {
  success,
  invalidEmail,
  unknownException,
  userNotFound,
  wrongPassword,
  emailUnverified
}
