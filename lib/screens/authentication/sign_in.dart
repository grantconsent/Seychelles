import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final _signInkey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
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
                          image: kGrantConsentLogo,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "CONSENT",
                          style:
                              TextStyle(fontSize: 29, color: kButtonTextColor2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: CustomTextFormField(
                          hintText: "Phone Number",
                          textInputType: TextInputType.number,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: CustomTextFormField(
                              obscure: true,
                              icon: Icon(
                                Icons.remove_red_eye,
                                size: 15,
                                color: kButtonTextColor2,
                              ),
                              hintText: "Password")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Checkbox(
                                value: checkBoxValue,
                                activeColor: kButtonTextColor2,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    checkBoxValue = newValue;
                                  });
                                }),
                            Text(
                              'remember me',
                              style: GoogleFonts.quicksand(
                                textStyle: TextStyle(color: kButtonTextColor2),
                              ),
                            )
                          ]),
                          Text(
                            'forgot password?',
                            style: TextStyle(color: kButtonTextColor2),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: GestureDetector(
                                onTap: () {
//                                On tap sign up
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kButtonTextColor2,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 50,
//                                color: kButtonTextColor2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Sign In',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                        ),
                                        Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "OR",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 45.0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: GestureDetector(
                                onTap: () {
//                                on tap google sign up
                                },
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
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ),
                                    leading: Image(
                                      image: kGoogleLogo,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, top: 30),
            child: GestureDetector(
              onTap: () {
//                on tap sign in
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: kButtonTextColor2, fontSize: 15),
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ],
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
        style:
            GoogleFonts.roboto(textStyle: TextStyle(color: kButtonTextColor2)),
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
