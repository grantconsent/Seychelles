import 'dart:io';
import 'package:grantconsent/screens/upload_user_picture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';

import '../utilities/styles.dart';
import '../utilities/styles.dart';
import '../utilities/styles.dart';

class GetUserPicture extends StatefulWidget {
  @override
  _GetUserPictureState createState() => _GetUserPictureState();
}

class _GetUserPictureState extends State<GetUserPicture> {
  File _uploadedImage;
  bool pictureAdded = false;
  final keyToScaffold = new GlobalKey<ScaffoldState>();

  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _uploadedImage = image;
    });
    if (image != null)
      pictureAdded = true;
    else
      pictureAdded = false;
  }

  void _showToastInformation() {
    keyToScaffold.currentState.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        duration: Duration(seconds: 2),
        content: Container(
          alignment: Alignment.center,
          height: 20,
          child: Text(
            'Please, add a picture first.',
            style: kBody1TextStyle,
          ),
        ),
      ),
    );
  }

  ConstrainedBox _buildPlaceholder() {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kScreenSize.width,
          height: kScreenSize.height * 0.65,
        ),
        child: kUserPicturePlaceholder);
  }

  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: keyToScaffold,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: _getImageFromCamera,
              child: _uploadedImage == null
                  ? _buildPlaceholder()
                  : Image.file(
                      _uploadedImage,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: kScreenSize.width,
                      height: kScreenSize.height * 0.65,
                    ),
            ),
            Spacer(
              flex: 2,
            ),
            UserActionButton(
                //locked: !pictureAdded,
                onTap: !pictureAdded
                    ? _showToastInformation
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadPicture(),
                          ),
                        );
                      },
                label: 'Continue'),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
