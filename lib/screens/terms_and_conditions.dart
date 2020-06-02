import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/sign_up.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Terms extends StatelessWidget {
  final ValueNotifier data = ValueNotifier(null);
  Future loadAsset() async {
    data.value = await rootBundle.loadString('assets/terms.txt');
  }

  @override
  Widget build(BuildContext context) {
    loadAsset();
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: kGetStartedScreenBackground,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(34, 34, 34, 0.2), BlendMode.overlay),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              Text(
                'Terms and Conditions',
                style: kBody1TextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: kScreenSize.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: ValueListenableBuilder(
                    valueListenable: data,
                    builder: (context, data, child) {
                      return Text(
                        data ?? '',
                        style: kBody1TextStyle.copyWith(
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              UserActionButton(
                label: 'Agree and Continue',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                filled: true,
              ),
              Spacer(
                flex: 3,
              ),
              Center(
                child: Text(
                  'Download Terms Of Service',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
