import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/services/ge'

class UploadPicture extends StatefulWidget {
  @override
  _UploadPictureState createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  Future _addImageToFirebase() async{
    FirebaseStorage storage = FirebaseStorage.instance;
    final user = await FirebaseAuth.instance.currentUser();

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference =
    storage.ref().child("profileImages/${user.uid}");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    // Waits till the file is uploaded then stores the download url
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
