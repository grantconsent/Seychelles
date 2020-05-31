import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class CreateConsent extends StatefulWidget {
  @override
  _CreateConsentState createState() => _CreateConsentState();
}

class _CreateConsentState extends State<CreateConsent> {
  int currentPage = 1;
  int pages = (consentQuestions.length / 5).round();
  var json;
  bool questionsReady = false;

  void getQuestions() async {
    questionsReady = false;
    String x = await rootBundle
        .loadString('assets/Consent/consent_ageement_data.json');
    json = jsonDecode(x);

    setState(() {
      questionsReady = true;
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: PageView(
                  children: [
                    for (int i = 1; i <= pages; i++)
                      ListView(
                        children: !questionsReady
                            ? [CircularProgressIndicator()]
                            : [
                                for (int i = (currentPage - 1) * 5;
                                    i < currentPage * 5;
                                    i++)
                                  if (consentQuestions.length > i)
                                    consentQuestions[i]
                              ],
                      )
                  ],
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
              ),
              buildPageNavigation(),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Row buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // SizedBox(width: 20),
        Text('Create consent'),
        Spacer(),
        Image.asset(
          "assets/cam.png",
          width: 50,
          height: 50,
        ),
      ],
    );
  }

  Row buildPageNavigation(
      /* {@required int currentPage, @required int pages} */) {
    return Row(
      children: <Widget>[
        Spacer(flex: 2),
        FlatButton(
          onPressed: () {
            setState(() {
              if (currentPage > 1) currentPage -= 1;
            });
          },
          child: Text('Previous'),
        ),
        Spacer(),
        Container(
          width: 40,
          height: 20,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            '$currentPage/$pages',
          ),
        ),
        Spacer(),
        FlatButton(
          onPressed: () {
            setState(() {
              if (currentPage < pages) currentPage += 1;
            });
          },
          child: Text('Next'),
        ),
        Spacer(flex: 2)
      ],
    );
  }
}

class ConsentQuestion extends StatefulWidget {
  ConsentQuestion({
    Key key,
    @required this.question,
    @required this.optionTypes,
    @required this.labels,
  }) : assert(optionTypes.length == labels.length);

  ConsentQuestion.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        optionTypes = List<ConsentOptionType>.from(json['optionTypes']),
        labels = json['labels'].cast<String>();

  final String question;
  final List<ConsentOptionType> optionTypes;
  final List<String> labels;

  @override
  ConsentQuestionState createState() => ConsentQuestionState();
}

class ConsentQuestionState extends State<ConsentQuestion> {
  List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(widget.optionTypes.length, (index) => false);
  }

  void responseToTap(int index) {
    //TODO: Use index to update storage of question answer.
    setState(() {
      for (int indexBtn = 0; indexBtn < _isSelected.length; indexBtn++) {
        if (indexBtn == index) {
          _isSelected[indexBtn] = !_isSelected[indexBtn];
        } else {
          _isSelected[indexBtn] = false;
        }
      }
    });
  }

  buildButtons(int index) {
    return ConsentOptionButton(
      type: widget.optionTypes[index],
      selected: _isSelected[index],
      responseTap: () {
        responseToTap(index);
      },
      label: widget.labels[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.question,
            style: GoogleFonts.quicksand(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: List.generate(
                widget.optionTypes.length, (index) => buildButtons(index)),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
