import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

Future<ConsentUser> checkForUser() async {
  final _auth = FirebaseAuth.instance;
  final user = await _auth.currentUser();
  if (user != null) {
    //TODO: Fetch user's name from firestore based on the email. Make Consent User object (existingUser) based on fetched data
    //Capitalize name
    String userName = user.email.substring(0, user.email.indexOf('@'));
    userName = userName.substring(0,1).toUpperCase() + userName.substring(1,userName.length);
    //--Capitalize name
    ConsentUser existingUser = ConsentUser(
      name: userName,
      email: user.email,
    );
    return existingUser;
  } else
    return null;
}
