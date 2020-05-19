import 'package:flutter/material.dart';
import 'package:grantconsent/utilities/styles.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
                      child: TextField(
                        style: TextStyle(color: kButtonTextColor2),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kButtonTextColor2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(202, 180, 128, 0.3),
                            labelStyle: TextStyle(
                                color: Color(0xFFcab480), fontSize: 10),
                            labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: TextField(
                        style: TextStyle(color: kButtonTextColor2),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kButtonTextColor2),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Color.fromRGBO(202, 180, 128, 0.3),
                            labelStyle: TextStyle(
                                color: Color(0xFFcab480), fontSize: 10),
                            labelText: "Email"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: TextField(
                        style: TextStyle(color: kButtonTextColor2),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kButtonTextColor2),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            fillColor: Color.fromRGBO(202, 180, 128, 0.3),
                            labelStyle: TextStyle(
                                color: kButtonTextColor2, fontSize: 10),
                            labelText: "Phone Number"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: TextField(
                        style: TextStyle(color: kButtonTextColor2),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kButtonTextColor2),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              size: 15,
                              color: kButtonTextColor2,
                            ),
                            fillColor: Color.fromRGBO(202, 180, 128, 0.3),
                            labelStyle: TextStyle(
                                color: kButtonTextColor2, fontSize: 10),
                            labelText: "Password"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: TextField(
                        style: TextStyle(color: kButtonTextColor2),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kButtonTextColor2),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            filled: true,
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              size: 15,
                              color: kButtonTextColor2,
                            ),
                            fillColor: Color.fromRGBO(202, 180, 128, 0.3),
                            labelStyle: TextStyle(
                                color: kButtonTextColor2, fontSize: 10),
                            labelText: "Confirm Password"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
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
                                  padding: const EdgeInsets.only(left: 30.0, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
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
                            style: TextStyle(
                                color: Colors.white, fontSize: 15.0),
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
                                    'Sign Up with Google',
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  ),
                                  leading: Image(
                                    image: AssetImage('assets/Google Logo.png'),
                                   // color: Colors.white,
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
                  Text('Already have an account? ', style: TextStyle(color: kButtonTextColor2, fontSize: 11),),
                  Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 11),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
