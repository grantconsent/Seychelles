import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Text('Terms and Conditions',
              style: kBody1TextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Spacer(
                flex: 2,
              ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: kScreenSize.height * 0.6,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Text('''Upload your ID card and wait for the admin to approve you.
    Form Details - What Ideas do you have for the main consent form?
    <<<<<<<<<This questions should probably be one per screen with funny emojis/images and all the user has to do is click yes/no and next/previous for questions>>descriptive images too>>>>>>>>
    Something like the question about Kissing.
    Is <Proposer> allowed to kiss you?
    If answer is yes. Question slides up with YES attached.
    Then the with tongue question.

    •
    Hello <User\'s Name>
    Is this you?  {request pin Auth or something }
    Granting consent or asking for one? {app flow divides here}
    {system to link users: consent URL, consent code, QR code scan, etc. Options decided by team, method decided by user}
    {display agreement clauses in demystified language, probably in slides}
    You are granting consent to <Proposer\'s Name>
    You agree to let <Proposer> touch your external body


    ...simplify the terms of the agreement https://eforms.com/images/2017/08/Sexual-Consent-Form.docx …

    You grant consent to <Proposer> to {summary of consent}
    Willing to try anything else with <Proposer>?
    {allow Consenter to add to agreement and send back to Proposer}
    Notifier: this consent serves as a legal agreement between <Proposer> and <Consenter> within the terms selected.
    You\'re both agreed! Bon Chance!  😁
    •

    Your Name - Should already be available from Sign up.
    Name of Partner - should be an existing user as well
    Date Signed - Should be auto generated DateTimeStamp
    What method of contraception is allowed?
    What method of protection?
    How far do you want to go? Kissing, Sex, Anal Sex,
    https://eforms.com/images/2017/08/Sexual-Consent-Form.docx
    What does digital penetration mean?? When you insert your finger into the pussy or booty hole
    What other activities are you proposing to partake in?

    Few days after confirmation that things went well, cause if its immediate the other party could be forced to consent that it went well.

    I see this app even becoming a fun way to flirt between partners (married people included).
Imagine receiving a consent proposal from your partner while you are at work and you are just breezing through imagining how the day will end for you.

                I also just understood that all the consent questions go both ways. So even as a proposer, you have to decide what you are also giving consent to.
  The proposer/consenter tag is just to indicate who started the request.

                Should the consent pages be questions posed to the user or statements agreed to?
                So either in the form
                This agreement is for when?
  Or
  This agreement is for.

  Do you want to kiss <partner>?
                Or
                I want to kiss <partner>.
                `
                BY CLICKING AGREE AND CONTINUE YOU HAVE AGREEDTO OUR TERMS OF SERVICE.''',
    style: kBody1TextStyle.copyWith(
      color: Colors.black,
    ),),
                          ),

),
              Spacer(
                flex: 2,
              ),
              UserActionButton(
                label: 'Agree and Continue',
                onTap: (){},
                filled: true,
              ),
              Spacer(
                flex: 3,
              ),
              Center(
                child: Text('Download Terms Of Service',
                style: kBody1TextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                ),),
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
