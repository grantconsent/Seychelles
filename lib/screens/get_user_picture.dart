import 'dart:io';
import 'package:grantconsent/screens/upload_user_picture.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/custom_widgets.dart';

ValueNotifier displayedImage = ValueNotifier(null);

class GetUserPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 3,
            ),
            SelectAndDisplayImage(),
            Spacer(
              flex: 2,
            ),
            UserActionButton(
                onTap: () {
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

class SelectAndDisplayImage extends StatefulWidget {
  @override
  _SelectAndDisplayImageState createState() => _SelectAndDisplayImageState();
}

class _SelectAndDisplayImageState extends State<SelectAndDisplayImage> {
  File _uploadedImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _uploadedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: _uploadedImage == null
          ? ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: kScreenSize.width,
                height: kScreenSize.height * 0.65,
              ),
              child: Image.asset('assets/GIFs/loaderloop.gif'),
            )
          : Image.file(
              _uploadedImage,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              width: kScreenSize.width,
              height: kScreenSize.height * 0.65,
            ),
    );
  }
}
