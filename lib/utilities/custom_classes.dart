import 'package:flutter/material.dart';

ConsentUser loggedInUser;

class ConsentUser {
  String uID;
  String firstName;
  String fullName;
  String lastName;
  String email;
  String phoneNumber;
  String pictureURL;
  ConsentUser(
      {this.uID,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      this.phoneNumber,
      this.fullName,
      this.pictureURL});
}

class ConsentUserSignIn {
  String email;
  ConsentUserSignIn({
    @required this.email,
  });
}

class CloudStorageResult {
  final String imageUrl;
  CloudStorageResult({this.imageUrl});
}
