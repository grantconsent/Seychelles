import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
String linkData;
class DynamicLinksService {
  String myLink;
  Future handleDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLinksData) async {
      _handleDeepLink(dynamicLinksData);
    }, onError: (OnLinkErrorException e) async {
      //TODO: Handle dynamic link error when app is already running
      print('Dynamic Link error ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    Uri deeplink = data?.link;
    if (deeplink != null) {
      print('deeplink : $deeplink');
      linkData = deeplink.toString();
    }
  }

  Future<String> createDynamicLinks(String dataToSend) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://grantconsent.page.link',
      link: Uri.parse('https://Seychelles/$dataToSend'),
      androidParameters: AndroidParameters(
        packageName: "com.example.grantconsent",
      ),
      //TODO: Add iOS parameters for dynamic links to work on iOS devices
      socialMetaTagParameters: SocialMetaTagParameters(
          title: 'Grant Consent',
          description: "You have been invited to grant a consent"),
    );
    // final dynamicLink = await parameters.buildUrl();
    final ShortDynamicLink myShortLink = await parameters.buildShortLink();
    //  myLink = dynamicLink.toString();
    myLink = myShortLink.shortUrl.toString();
    return myLink;
  }
}
