import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: kLoaderGIF,
      ),
    );
  }
}