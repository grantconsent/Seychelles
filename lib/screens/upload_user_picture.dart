import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grantconsent/screens/get_user_picture.dart';

class UploadPicture extends StatefulWidget {
  final uploadedImage;
  UploadPicture( this.uploadedImage);
  @override
  _UploadPictureState createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  var uploadedImage;
  UploadPicture(uploadedImage);

  Future _addImageToFirebase() async{
    FirebaseStorage storage = FirebaseStorage.instance;
    final user = await FirebaseAuth.instance.currentUser();

    //Create a reference to the location you want to upload to in firebase
    StorageReference reference =
    storage.ref().child("profileImages/${user.uid}");

    //Upload the file to firebase
    StorageUploadTask uploadTask = reference.putFile(uploadedImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    // Waits till the file is uploaded then stores the download url
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
  }

  ///This variable controls which GIF and text is displayed
  ///
  ///Set to true after uploading picture successfully.
  /// Future _addImageToFirebase() async{

  final bool done = false;

  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Text(
              done ? 'Uploaded Successfully' : 'Uploading',
              style: kBody1TextStyle,
            ),
            Spacer(),
            Container(
              width: kScreenSize.width,
              height: 163,
              alignment: Alignment.center,
              color: Colors.white,
              child: done ? kUploadedGIF : kUploadingGIF,
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
