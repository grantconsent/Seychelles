import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/get_started_screen.dart';

import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class SplashScreen extends StatelessWidget {
  final PageController splashPageController = PageController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier pageNotifier = ValueNotifier(0);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(kScreenSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(flex: 5),
              Expanded(
                flex: 8,
                child: PageView.builder(
                  itemCount: kNumberOfSplashPages,
                  itemBuilder: (context, page) {
                    return SplashPage(page: page);
                  },
                  onPageChanged: (page) {
                    pageNotifier.value = page;
                  },
                  controller: splashPageController,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 46),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ValueListenableBuilder(
                            valueListenable: pageNotifier,
                            builder: (context, value, child) {
                              return SlideIndicatorPane(currentPage: value);
                            }),
                        AppIconButton(
                          onTap: () {
                            // if (splashPageController.page <
                            //     kNumberOfSplashPages - 1) {
                            //   splashPageController.nextPage(
                            //     duration: kSplashScreenPageAnimationDuration,
                            //     curve: Curves.easeOut,
                            //   );
                            // } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetStarted(),
                              ),
                            );
                            //     }
                          },
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

///Part of the Splash screen page that animates
///Holds the list of pages
class SplashPage extends StatelessWidget {
  final int page;
  final List<SplashPageContent> contentList = [
    SplashPageContent(kSplashPage1Image, kSplashPage1Text),
    SplashPageContent(kSplashPage2Image, kSplashPage2Text)
  ];

  SplashPage({this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: 335,
              height: 297,
            ),
            child: Image(
              image: contentList[page].image,
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 87.0),
            child: Text(contentList[page].text, style: kBody1TextStyle),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

///Object holding image and caption properties
///for Splash Screen
class SplashPageContent {
  final ImageProvider image;
  final String text;

  SplashPageContent(this.image, this.text);
}
