import 'package:url_launcher/url_launcher.dart';


///Creates a preformatted message to the input [phoneNumber] on whatsapp
///
///P
sendConsentViaWhatsapp({String phoneNumber, String link}) async {
  String message = _whatsappTemplate.replaceAll('*link*', link);
  var sendUrl = "whatsapp://send?phone=$phoneNumber&text=$message";

  if (await canLaunch(sendUrl)) {
    await launch(sendUrl);
  } else {
    throw 'Could not launch $sendUrl';
  }
}

String _whatsappTemplate =
    '''Hello! \n a sexual consent request has been sent to you. \n\n 
Follow this link to review - *link* \n\n
via Grant Consent.''';
