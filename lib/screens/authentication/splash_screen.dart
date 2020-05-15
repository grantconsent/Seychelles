import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grantconsent/screens/authentication/sign_up.dart';
import 'package:grantconsent/utilities/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: splashScreenBody(),
    );
  }

  Widget splashScreenBody() => Container(
        child: SliderLayoutView(),
      );
}

class SliderLayoutView extends StatefulWidget {
  @override
  _SliderLayoutViewState createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            itemBuilder: (ctx, i) => SlideItem(i),
            itemCount: sliderArrayList.length,
            onPageChanged: _onPageChanged,
            controller: _pageController,
            scrollDirection: Axis.horizontal,
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            for (int i = 0; i < sliderArrayList.length; i++)
                              if (i == _currentPage)
                                SlideDots(true)
                              else
                                SlideDots(false)
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 52,
                        child: Ink(
                          decoration: ShapeDecoration(
                              color: kButtonTextColor2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, right: 35.0, top: 35.0, bottom: 5),
                      child: Image(
                        height: 100,
                        image: AssetImage('assets/Logo.png'),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "CONSENT",
                        style: TextStyle(
                            fontSize: 25, color: kButtonTextColor2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width * 0.9,
                    width: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(sliderArrayList[index].sliderImageUrl),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 30),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        sliderArrayList[index].sliderText,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w200,
                            letterSpacing: 1.5,
                            fontSize: 18.5,
                            color: kButtonTextColor2),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class SlideDots extends StatelessWidget {
  final bool isActive;

  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 3.5),
        height: isActive ? 10 : 6,
        width: isActive ? 10 : 6,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey,
          border: isActive
              ? Border.all(
                  color: kButtonTextColor2,
                  width: 3.0,
                )
              : Border.all(
                  color: Colors.transparent,
                  width: 1,
                ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderText;

  Slider({@required this.sliderImageUrl, @required this.sliderText});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/Splash image 1.png',
      sliderText: 'Digitise your consent. Yes is Yes and No is No.'),
  Slider(
      sliderImageUrl: 'assets/Splash image 2.png',
      sliderText: 'Get consent before you get in trouble.'),
];
