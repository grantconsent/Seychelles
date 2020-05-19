import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/styles.dart';

class UploadPicture extends StatelessWidget {
  ///This variable controls which GIF and text is displayed
  ///
  ///Set to true after uploading picture successfully.
  bool done = false;
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
