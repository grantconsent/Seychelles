import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class CreateConsent extends StatelessWidget {
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
              Row(
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
              ),
              SizedBox(height: 25),
              ConsentQuestion(
                question: 'What the question is ?',
                optionTypes: [ConsentOptionType.yes, ConsentOptionType.no],
                labels: ['Yes', 'No'],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(flex: 2),
                  InkWell(
                    onTap: () {},
                    child: Text('Previous'),
                  ),
                  Spacer(),
                  Container(
                    width: 40,
                    height: 20,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text(
                      '1/3',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text('Next'),
                  ),
                  Spacer(flex: 2)
                ],
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

class ConsentQuestion extends StatefulWidget {
  ConsentQuestion({
    @required this.question,
    @required this.optionTypes,
    @required this.labels,
  }) : assert(optionTypes.length == labels.length);

  ConsentQuestion.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        optionTypes = json['optionTypes'],
        labels = json['labels'];

  final String question;
  final List<ConsentOptionType> optionTypes;
  final List<String> labels;

  @override
  _ConsentQuestionState createState() => _ConsentQuestionState();
}

class _ConsentQuestionState extends State<ConsentQuestion> {
  _ConsentQuestionState();

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

// frf() async {
//   var x =
//       await rootBundle.loadString('assets/Consent/consent_ageement_data.json');
//   String result = jsonDecode(x)[0]['question'];
//   print(result);
// }
