import 'package:flutter/material.dart';
import 'dart:io';

ConsentUser loggedInUser;

class ConsentUser {
  String firstName;
  String fullName;
  String lastName;
  String email;
  String phoneNumber;
  String pictureURL;
  ConsentUser(
      {@required this.firstName,
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

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({
    @required File imageToUpload,
  }) async {
  }
}
class CloudStorageResult {
  final String imageUrl;
  CloudStorageResult({this.imageUrl});
}
