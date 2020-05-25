import 'package:firebase_auth/firebase_auth.dart';

void signOutUser() {
  final _auth = FirebaseAuth.instance;
  _auth.signOut();
}
