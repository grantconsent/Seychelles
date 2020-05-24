
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grantconsent/screens/splash_screen.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    kScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: AnimatedLogo(),
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with TickerProviderStateMixin {
  var repeatAnimation = 0;

  @override
  void initState() {
    super.initState();
    slideAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration);
    scaleAnimationController = AnimationController(
        vsync: this, duration: kLoadingScreenAnimationDuration)
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          scaleAnimationController.reverse();
          scaleAnimationController.addStatusListener((status) {
            if(status == AnimationStatus.dismissed){
              slideAnimationController.forward();
              setState(() {
                opacity = 1.0;
              });
            }
          });
        }
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    CurveTween scaleCurveTween = CurveTween(curve: Curves.easeInExpo);
    scaleAnimation = Tween<double>(
      begin: 1,
      end: kLoadingScreenAnimationScale,
    ).chain(scaleCurveTween);

    final screenHeight = MediaQuery.of(context).size.height;

    //Offset Points for the logo image
    double logoImageYEndOffset = (screenHeight - 2.4) - screenHeight;
    double logoImageXEndOffset = -1.5;

    //Offset Points for the logo text
    double textImageYEndOffset = (screenHeight - 8.5) - screenHeight;
    double textImageXEndOffset = -1.4;

    //Curve tween to make the animation fast initially and slow
    CurveTween slideTweenCurve = CurveTween(
      curve: Curves.fastLinearToSlowEaseIn,
    );

    logoImageSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(logoImageXEndOffset, logoImageYEndOffset),
    ).chain(slideTweenCurve);

    logoTextSlideAnimation = Tween<Offset>(
      begin: Offset(textImageXEndOffset, 0),
      end: Offset(textImageXEndOffset, textImageYEndOffset),
    ).chain(slideTweenCurve);
  }

  AnimationController scaleAnimationController;
  Animatable<double> scaleAnimation;

  AnimationController slideAnimationController;
  Animatable<Offset> logoImageSlideAnimation;
  Animatable<Offset> logoTextSlideAnimation;

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          child: SplashScreen(),
          opacity: opacity,
          duration: kLoadingScreenAnimationDuration,
        ),
        Center(
          child: ScaleTransition(
            scale: scaleAnimationController.drive(scaleAnimation),
            child: SlideTransition(
              position: slideAnimationController.drive(logoImageSlideAnimation),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Hero(
                    child: GrantConsentLogo(LogoType.mediumWithoutText),
                    tag: "logoHeroTag",
                  ),
                  AnimatedOpacity(
                    opacity: opacity,
                    duration: kLoadingScreenAnimationDuration,
                    child: Text(
                      'CONSENT',
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        color: kButtonTextColor2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class SplashScreenE extends StatelessWidget {
//   final PageController splashPageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     ValueNotifier pageNotifier = ValueNotifier(0);

//     return Scaffold(
//       backgroundColor: kBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Spacer(flex: 2),
// //          Padding(
// //            padding: const EdgeInsets.only(left: 40.1),
// //            child: GrantConsentLogo(LogoType.mediumWithText),
// //          ),
//           Spacer(flex: 1),
//           Expanded(
//             flex: 8,
//             child: PageView.builder(
//               itemCount: kNumberOfSplashPages,
//               itemBuilder: (context, page) {
//                 return SplashPage(page: page);
//               },
//               onPageChanged: (page) {
//                 pageNotifier.value = page;
//               },
//               controller: splashPageController,
//               physics: BouncingScrollPhysics(),
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(40, 0, 40, 46),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   ValueListenableBuilder(
//                       valueListenable: pageNotifier,
//                       builder: (context, value, child) {
//                         return SlideIndicatorPane(currentPage: value);
//                       }),
//                   AppIconButton(onTap: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => GetStarted(),
//                       ),
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// ///Part of the Splash screen page that animates
// ///Holds the list of pages
// class SplashPage extends StatelessWidget {
//   final int page;
//   final List<SplashPageContent> contentList = [
//     SplashPageContent(kSplashPage1Image, kSplashPage1Text),
//     SplashPageContent(kSplashPage2Image, kSplashPage2Text)
//   ];

//   SplashPage({this.page});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           ConstrainedBox(
//             constraints: BoxConstraints.tightFor(
//               width: 335,
//               height: 297,
//             ),
//             child: Image(
//               image: contentList[page].image,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(right: 87.0),
//             child: Text(contentList[page].text, style: kBody1TextStyle),
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }

// ///Object holding image and caption properties
// ///for Splash Screen
// class SplashPageContent {
//   final ImageProvider image;
//   final String text;

//   SplashPageContent(this.image, this.text);
// }
