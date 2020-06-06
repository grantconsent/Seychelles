import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_classes.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class ReviewConsent extends StatelessWidget {
  String proposerImageUrl, proposerName, consenterName;
  bool consenter = false;
  Row buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // SizedBox(width: 20),
        Text(
          'Review consent',
          style: kDashboardHeaderTextStyle,
        ),
        Spacer(),
        Image.asset(
          "assets/cam.png",
          width: 41,
          height: 41,
        ),
      ],
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: kScreenSize.width,
          height: kScreenSize.height *0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.separated(
              itemBuilder: (context, count) =>
                  Text('    Some data about the consent'),
              separatorBuilder: (context, count) => Divider(),
              itemCount: 25),
        ),
        Row(
          children: <Widget>[
            ConsentActionButton(
              labelText: 'GRANT',
              buttonType: ConsentOptionType.yes,
              onTap: () {
                print('GRANT');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewConsentFeedback(
                      context,
                      type: FeedbackType.accepted,
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            ConsentActionButton(
              labelText: 'DENY',
              buttonType: ConsentOptionType.no,
              onTap: () {
                print('DENY');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewConsentFeedback(
                      context,
                      type: FeedbackType.rejected,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        Spacer(flex: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: REMOVE THIS LINE
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDashboardBackgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: kToolbarHeight),
              buildHeader(),
              Spacer(flex: 2),
              Text(
                "Hi, Bami " /* ${loggedInUser.firstName}" */,
                style: kWelcomeDashboardTextStyle,
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 41,
                    width: 41,
                    child: Image(
                      image: proposerImageUrl == null
                          ? AssetImage(
                              "assets/cam.png",
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(proposerImageUrl),
                              radius: 23,
                            ),
                    ),
                  ),
                  Text(consenter
                      ? '$proposerName sent you a consent request.'
                      : 'You sent $consenterName a consent request'),
                ],
              ),
              Spacer(flex: 1),
              Text('Consent Review', style: kDashboardDynamicTextStyle),
              Expanded(flex: 20, child: getBody(context)),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewConsentFeedback extends ReviewConsent {
  ReviewConsentFeedback(BuildContext context, {this.type});

  final FeedbackType type;
  @override
  Widget getBody(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Text(
            'You have ${type == FeedbackType.accepted ? "accepted" : "rejected"} consent from $proposerName'),
        ConsentActionButton(
            labelText: 'DISMISS',
            buttonType: ConsentOptionType.no,
            onTap: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}

enum FeedbackType { accepted, rejected }
