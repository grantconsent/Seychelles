import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'styles.dart';

///Displays the logo of the Grant Consent App.
///
///Specify display style using ```
///LogoType
///``` enum
/// + mediumWithText
/// + mediumWithoutText
/// + largeWithText
/// + largeWithoutText
///
class GrantConsentLogo extends StatelessWidget {
  final LogoType type;
  GrantConsentLogo(this.type);

  final Widget mediumLogoImage = ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 78.9, height: 78.0),
    child: Image(
      image: kGrantConsentLogo,
    ),
  );

  final Widget largeLogoImage = ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 106.21, height: 105.0),
    child: Image(
      image: kGrantConsentLogo,
    ),
  );
  @override
  Widget build(BuildContext context) {
    if (type == LogoType.mediumWithoutText)
      return mediumLogoImage;
    else if (type == LogoType.largeWithoutText)
      return largeLogoImage;
    else if (type == LogoType.mediumWithText)
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            mediumLogoImage,
            SizedBox(height: 6),
            Text(
              'CONSENT',
              style: GoogleFonts.quicksand(
                fontSize: 18,
                color: kButtonTextColor2,
              ),
            )
          ],
        ),
      );
    else /*  (type == LogoType.largeWithText) */
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            largeLogoImage,
            Text(
              'CONSENT',
              style: GoogleFonts.quicksand(
                fontSize: 27,
                color: kButtonTextColor2,
              ),
            )
          ],
        ),
      );
  }
}

///A rounded border button with ```
///Icons.chevron_right``` icon.
///Button used in ```
///SplashScreen()
///```
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    @required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(width: 52, height: 40),
      child: FlatButton(
        onPressed: onTap,
        child: Icon(Icons.chevron_right, color: kButtonTextColor1),
        color: kButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

///Display Animated dot component for
///```
///SlideIndicatorPane ```
class SlideIndicatorDot extends StatelessWidget {
  final bool isActive;
  SlideIndicatorDot(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.only(right: 8.0),
      constraints: BoxConstraints.tightFor(width: 7, height: 7),
      decoration: BoxDecoration(
        color: isActive ? kButtonColor : kInactiveSlideDotColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

///Display a row of ```
///SlideIndicatorDot``` 's and indicate which page is active.
///
class SlideIndicatorPane extends StatelessWidget {
  SlideIndicatorPane({@required this.currentPage});

  final int currentPage;
  final List<SlideIndicatorDot> _slideIndicators = [
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
  ];
  List<SlideIndicatorDot> _slideIndicatorsBlank = [
    SlideIndicatorDot(false),
    SlideIndicatorDot(false),
  ];

  void prepIndicators() {
  //  _slideIndicators.clear();
    _slideIndicators.setAll(0, _slideIndicatorsBlank);
    _slideIndicators[currentPage] = SlideIndicatorDot(true);
  }

  @override
  Widget build(BuildContext context) {
    prepIndicators();
    return Container(
      child: Row(
        children: _slideIndicators,
      ),
    );
  }
}

///Creates a button with.
/// +5 pixel rounded edges.
/// +Trailing ```
/// Icons.chevron_right ``` icon.
/// + and [label] String as title.
///
///
///
class UserActionButton extends StatelessWidget {
  UserActionButton({
    @required this.onTap,
    @required this.label,
    this.filled,
  }) {
    if (filled == null)
      isfilled = true;
    else
      isfilled = filled;
  }

  final Function onTap;
  final String label;
  final bool filled;
  bool isfilled;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      constraints:
          BoxConstraints.tightFor(width: kScreenSize.width, height: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isfilled ? kButtonColor : Colors.transparent,
        border: isfilled ? null : Border.all(color: kButtonColor),
      ),
      child: RawMaterialButton(
        padding: EdgeInsets.only(left: 40, right: 14.4),
        onPressed: onTap,
        constraints: BoxConstraints.expand(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: isfilled
                  ? kButtonTextStyle
                  : kButtonTextStyle.copyWith(color: kButtonTextColor2),
            ),
            Icon(
              Icons.chevron_right,
              color: isfilled ? kButtonTextColor1 : kButtonTextColor2,
            ),
          ],
        ),
      ),
    );
  }
}


class UserGoogleButton extends StatelessWidget {

  UserGoogleButton({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff4285f4),
            borderRadius: BorderRadius.circular(5)),
        height: 50,
        child: ListTile(
          onTap: null,
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          title: Text(
            'Sign In with Google',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          leading: Image(
            image: AssetImage('assets/Google Logo.png'),
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {@required this.hintText, this.icon, this.textInputType, this.obscure});

  final String hintText;
  final Icon icon;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(color: kButtonTextColor2),
        obscureText: obscure == null ? false : obscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: kButtonTextColor2),
          filled: true,
          suffixIcon: icon,
          fillColor: Color.fromRGBO(202, 180, 128, 0.3),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
        keyboardType: textInputType);
  }
}




