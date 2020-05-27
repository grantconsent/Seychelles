import 'package:firebase_auth/firebase_auth.dart';

void signOutUser() async {
  final _auth = FirebaseAuth.instance;
  await _auth.signOut();
}
