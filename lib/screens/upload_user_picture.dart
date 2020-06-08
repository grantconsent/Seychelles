import 'package:flutter/material.dart';
import 'package:grantconsent/services/firebase_upload_user_picture.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'dart:io';
import 'package:grantconsent/utilities/custom_widgets.dart';

class UploadPicture extends StatelessWidget {
  final File uploadedImage;
  UploadPicture(this.uploadedImage) {
    sendImage(uploadedImage);
  }

  void sendImage(File uploadedImage) async {
    PictureUploadStatus uploadStatus;
    uploadStatus = await uploadImage(image: uploadedImage);
    if (uploadStatus == PictureUploadStatus.completed) {
      uploadingFinished.value = true;
    } else {
      _showToastInformation();
    }
  }

  final ValueNotifier uploadingFinished = ValueNotifier(false);
  final keyToScaffold = new GlobalKey<ScaffoldState>();

  void _showToastInformation() {
    keyToScaffold.currentState.showSnackBar(
      customSnackBar(
        message: "Couldn't upload image. Please try again",
        durationInSeconds: 5,
      ),
    );
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
            ValueListenableBuilder(
                valueListenable: uploadingFinished,
                builder: (context, done, child) {
                  return Text(
                    done ? 'Uploaded Successfully' : 'Uploading',
                    style: kBody1TextStyle,
                  );
                }),
            Spacer(),
            Container(
              width: kScreenSize.width,
              height: 163,
              alignment: Alignment.center,
              color: Colors.white,
              child: ValueListenableBuilder(
                valueListenable: uploadingFinished,
                builder: (context, done, child) {
                  return done ? kUploadedGIF : kUploadingGIF;
                },
              ),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
