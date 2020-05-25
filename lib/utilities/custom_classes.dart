import 'package:flutter/material.dart';

class ConsentUser {
  String name;
  String email;
  String phoneNumber;
  String pictureURL;
  ConsentUser(
      {@required this.name,
      @required this.email,
      this.phoneNumber,
      this.pictureURL});
}

class ConsentUserSignIn {
  String email;
  ConsentUserSignIn({
    @required this.email,
  });
}
