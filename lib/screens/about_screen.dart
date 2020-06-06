import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

 class  AboutPage extends AboutPageTemplate{
   final ValueNotifier about = ValueNotifier(null);
   Future loadAbout() async {
     about.value = await rootBundle.loadString('assets/about.txt');
   }
   @override
   Widget build(BuildContext context) {
     loadAbout();
     return AboutPageTemplate(
       valueListenableBuilder: ValueListenableBuilder(
         valueListenable: about,
         builder: (context, about, child) {
           return Text(
             about ?? '',
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
       title: 'About Grant Consent',
     );
   }
}
