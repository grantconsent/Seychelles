import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

Future<PictureUploadStatus> uploadImage({@required File image}) async {
  final StorageReference firebaseStorageRef =
      FirebaseStorage.instance.ref().child("profileImages/${loggedInUser.uID}");

  StorageUploadTask uploadImage = firebaseStorageRef.putFile(image);

  StorageTaskSnapshot storageSnapshot = await uploadImage.onComplete;

  if (uploadImage.isSuccessful || uploadImage.isComplete) {
    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    String url = downloadUrl.toString();

    updateUserFirestoreInfo(url);
    return PictureUploadStatus.completed;
  } else {
    return PictureUploadStatus.failed;
  }
}

void updateUserFirestoreInfo(String url) async {
  final _seychellesFirestore = Firestore.instance;
  await _seychellesFirestore
      .collection("Users")
      .document(loggedInUser.uID)
      .setData({'Picture': url}, merge: true);
}

enum PictureUploadStatus {
  completed,
  failed,
}
