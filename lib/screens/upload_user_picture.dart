import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/custom_classes.dart';

class UploadPicture extends StatefulWidget {
  final File uploadedImage;
  UploadPicture( this.uploadedImage,{Key key}): super(key: key);
  @override
  _UploadPictureState createState() => _UploadPictureState();
}


class _UploadPictureState extends State<UploadPicture> {
  final keyToScaffold = new GlobalKey<ScaffoldState>();
  bool done = false;
  String url;



  @override
  void initState() {
    super.initState();
    uploadImage(image:widget.uploadedImage);
  }
  void _showToastInformation() {
    keyToScaffold.currentState.showSnackBar(
      customSnackBar(message: 'Something Went Wrong. Try again Later.'),
    );
  }

  Future<CloudStorageResult> uploadImage({
    @required File image,
  }) async {

    final user = await FirebaseAuth.instance.currentUser();
    final StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child("profileImages/${user.uid}");
    StorageUploadTask uploadImage =  firebaseStorageRef.putFile(image);
    StorageTaskSnapshot storageSnapshot = await uploadImage.onComplete;
    if (uploadImage.isSuccessful || uploadImage.isComplete) {
      var downloadUrl = await storageSnapshot.ref.getDownloadURL();
      var url = downloadUrl.toString();
      print( url );
      setState(() {
        done = true;
      });

      return CloudStorageResult(
        imageUrl: url,
      );
    } else if (uploadImage.isInProgress) {

    }else{
      var showToastInformation = _showToastInformation;
    }
return null;
  }


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
