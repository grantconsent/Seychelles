import 'package:flutter/material.dart';

class ConsentUser {
  String name;
  String email;
  String phoneNumber;
  String pictureURL;
  ConsentUser(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      this.pictureURL});
}
