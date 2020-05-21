import 'package:url_launcher/url_launcher.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

const iOSLocalizedLabels = false;

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
        phoneNumbers.add(phoneNumberIterator.current.value);
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

///Template to be used to send whatsapp messages via app
///Format the string by replacing ```
///{link}```
/// with the link to send.
String _whatsappTemplate = '''Hello! \n 
a sexual consent request has been sent to you.\n\n

Follow this link to review - {link} \n\n

via Grant Consent.''';

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
