import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'dart:async';
import 'package:flutter/services.dart';

/// Sender email address for mails
const String grantConsentEmailAddress = 'grantconsent@gmail.com';

///Sender email password
const String grantConsentEmailPassword = 'SeychellesAwesomeBunch';

///HTML template to be formatted and sent
String _emailTemplate = '''#''';
Future getEmailTemplate() async {
  _emailTemplate = await rootBundle.loadString('assets/email.txt');
}

Future<MailStatus> sendConsentViaEmail(
    String recipientAddress, String link) async {
  //Login to email account.
  await getEmailTemplate();
  print(_emailTemplate);
  final smtpServer = gmail(grantConsentEmailAddress, grantConsentEmailPassword);

  //Format template to be sent
  String _emailMessage = _emailTemplate.replaceAll('{{link}}', link);

  //Prepare Email message.
  final consentEmail = Message()
    ..from = Address(grantConsentEmailAddress, 'Grant Consent')
    ..recipients.add(recipientAddress)
    ..subject = 'New Consent Request'
    ..html = _emailMessage;

  //Send Email message.
  try {
    final sendMail = await send(consentEmail, smtpServer);

    print('Message sent: ' + sendMail.toString());
    return MailStatus.success;
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
    return MailStatus.failed;
  }
}

enum MailStatus {
  success,
  failed,
}
