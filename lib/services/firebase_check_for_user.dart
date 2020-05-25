import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

Future<ConsentUser> checkForUser() async {
  final _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  if (user != null) {
    ConsentUser existingUser =
        ConsentUser(name: user.displayName, email: user.email);
    return existingUser;
  } else
    return null;
}
