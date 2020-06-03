import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ConsentUser> checkForUser() async {
  final _seychellesFirestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  String firstName;
  String fullName;
  String lastName;
  String phoneNumber;
  final user = await _auth.currentUser();
  if (user != null) {
    await _seychellesFirestore
        .collection("Users")
        .document(user.uid)
        .get()
        .then((value) {
      firstName = value.data['FirstName'];
      lastName = value.data['LastName'];
      phoneNumber = value.data['PhoneNumber'];
    });

    //--Capitalize name
    firstName = firstName[0].toUpperCase() + firstName.substring(1);
    lastName =lastName[0].toUpperCase() + lastName.substring(1);
    fullName = firstName + " " + lastName;
    //--Consent User
    ConsentUser existingUser = ConsentUser(
      fullName: fullName,
      lastName: lastName,
      firstName: firstName,
      email: user.email,
      phoneNumber: phoneNumber,
    );
    loggedInUser = existingUser;
    return existingUser;
  } else
    return null;
}
