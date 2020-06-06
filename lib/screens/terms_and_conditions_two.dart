import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';


class TermAndConditions extends AboutPageTemplate{
  final ValueNotifier notifier = ValueNotifier(null);
  Future loadTerms() async {
    notifier.value = await rootBundle.loadString('assets/terms.txt');
  }
  @override
  Widget build(BuildContext context) {
    loadTerms();
    return AboutPageTemplate(
      valueListenableBuilder: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, notifier, child) {
          return Text(
            notifier ?? '',
            style: kBody1TextStyle.copyWith(
              color: Colors.black,
              fontSize: 11,
            ),
          );
        },
      ),
      onTap: (){
        Navigator.pop(context);
      },
      title: 'Terms and conditions',
    );
  }

}