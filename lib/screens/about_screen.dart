import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';

class About extends StatelessWidget {
  final ValueNotifier terms = ValueNotifier(null);

  Future loadTerms() async {
    terms.value = await rootBundle.loadString('assets/terms2.txt');
  }

  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    loadTerms();
    return Scaffold(
      backgroundColor: Color(0xFFDED7C7),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15,5,5,0),
                child: Text(
                  'About Grant Consent',
                  style: kBody1TextStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: kScreenSize.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: ValueListenableBuilder(
                    valueListenable: terms,
                    builder: (context, terms, child) {
                      return Text(
                        terms ?? '',
                        style: kBody1TextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
