import 'package:firebase_auth/firebase_auth.dart';
//Putting these changes back
Future forgotPassword(String email)  async {
  FirebaseAuth _auth = FirebaseAuth.instance ;
  //TODO: Try and catch exceptions. Return status based on exceptions or success.
  try  {
    await  _auth.sendPasswordResetEmail(email: email);
    return  ForgotStatus.success;
  } catch  (e) {
    print(e );
    return e .toString().contains('ERROR_INVALID_EMAIL')
        ?  ForgotStatus.incorrect
        :  e.toString().contains('ERROR_USER_NOT_FOUND')
             ? ForgotStatus.invalid
             : ForgotStatus.internal;
  } 
} 

 enum ForgotStatus {
   success,
   incorrect,
   invalid,
   internal,
 }
