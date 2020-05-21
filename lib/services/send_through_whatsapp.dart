/**
This file contains functions to handle sending a whatsapp message to a contact selected by the user in app.

Format the string [_whatsappTemplate] to a template of the whatsapp message you want to send.
Use unique strings to identify the parts of the message that is dynamic. {link} is used for link below.

Adjust the arguments of the [sendConsentViaWhatsapp] function to take the dynamic fields in your message as input.
Inside the [sendConsentViaWhatsapp] function, chain together replaceAll() string functions to edit your template with your dynamic fields.

To use:
Call [pickAContact()] first, to allow user select a contact from their native contact list.
This returns a Future of a LocalContact object, that contains 
 + String name
 + List<String> phoneNumber

Call [sendConsentViaWhatsapp] with phoneNumber from the phoneNumber list property of the LocalContact object returned.
 **/

import 'package:url_launcher/url_launcher.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

const iOSLocalizedLabels = false;

///Template to be used to send whatsapp messages via app
///Format the string by replacing ```
///{link}```
/// with the link to send.
String _whatsappTemplate = '''Hello! \n 
a sexual consent request has been sent to you.\n
Follow this link to review - {link} \n
via Grant Consent.''';

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

Future<LocalContact> pickAContact() async {
  final PermissionStatus permissionStatus = await getContactReadPermission();
  if (permissionStatus == PermissionStatus.granted) {
    try {
      final Contact contact = await ContactsService.openDeviceContactPicker(
        iOSLocalizedLabels: iOSLocalizedLabels,
      );
      var phoneNumberIterator = contact.phones.iterator;
      List<String> phoneNumbers = [];
      while (phoneNumberIterator.moveNext()) {
        phoneNumbers.add(formatPhoneNumber(phoneNumberIterator.current.value));
      }
      LocalContact selectedContact = LocalContact(
        name: contact.displayName ?? contact.givenName,
        phoneNumber: phoneNumbers,
      );
      return selectedContact;
    } catch (e) {
      print('Some Error occurred while getting contact information.');
      return null;
    }
  } else {
    throw 'Grant Consent does not have permission to read your contacts';
  }
}

///
///Local contact class to hold only contact details we need for app functionality.
///
class LocalContact {
  String name;
  List<String> phoneNumber = [];

  LocalContact({
    this.name,
    this.phoneNumber,
  });
}

///Check and get contacts permission
Future<PermissionStatus> getContactReadPermission() async {
  final PermissionStatus permission = await Permission.contacts.status;

  if (permission != PermissionStatus.granted &&
      permission != PermissionStatus.denied) {
    final Map<Permission, PermissionStatus> permissionStatus =
        await [Permission.contacts].request();
    return permissionStatus[Permission.contacts] ??
        PermissionStatus.undetermined;
  } else {
    return permission;
  }
}

String formatPhoneNumber(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(' ', '');
  if (phoneNumber.substring(0, 1) != '+' &&
      phoneNumber.substring(0, 3) != '234' &&
      phoneNumber.substring(0, 1) == '0') {
    phoneNumber = '234$phoneNumber';
  }
  return phoneNumber;
}
