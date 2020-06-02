import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ConsentUser> checkForUser() async {
  final _seychellesFirestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  String userName;
  String phoneNumber;
  final user = await _auth.currentUser();
  if (user != null) {
    await _seychellesFirestore
        .collection("Users")
        .document(user.uid)
        .get()
        .then((value) {
      userName = value.data['Name'];
      phoneNumber = value.data['PhoneNumber'];
    });

    //--Capitalize name
    userName = userName[0].toUpperCase() + userName.substring(1);

    //--Consent User
    ConsentUser existingUser = ConsentUser(
      name: userName,
      email: user.email,
      phoneNumber: phoneNumber,
    );
    loggedInUser = existingUser;
    return existingUser;
  } else
    return null;
}
