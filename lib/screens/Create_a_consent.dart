import 'package:flutter/material.dart';
import 'package:grantconsent/screens/send_consent.dart';
import 'package:grantconsent/utilities/constants.dart';
import 'package:grantconsent/utilities/custom_widgets.dart';
import 'package:grantconsent/utilities/styles.dart';

class CreateConsent extends StatelessWidget {
  final ValueNotifier currentPage = ValueNotifier(0);
  final int pages = (consentQuestions.length / 5).round();
  final PageController paginationControl = PageController(keepPage: true);

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
                  controller: paginationControl,
                  children: [
                    for (int pageViewPage = 1;
                        pageViewPage <= pages;
                        pageViewPage++)
                      ListView(
                        children: [
                          for (int i = (pageViewPage - 1) * 5;
                              i < pageViewPage * 5;
                              i++)
                            if (consentQuestions.length > i) consentQuestions[i]
                        ],
                      )
                  ],
                  onPageChanged: (int page) {
                    currentPage.value = page;
                  },
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              buildPageNavigation(context),
              SizedBox(height: 15)
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
        Text(
          'Create consent',
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

  Row buildPageNavigation(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(flex: 2),
        RawMaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            paginationControl.previousPage(
                duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
          },
          child: Text(
            'Previous',
            textAlign: TextAlign.end,
            style: kQuestionNavigationTextStyle,
          ),
        ),
        Spacer(),
        ValueListenableBuilder(
          builder: (BuildContext context, currentPageValue, Widget child) {
            return Container(
              width: 40,
              height: 20,
              alignment: Alignment.center,
              color: Colors.white,
              child: Text(
                '${currentPageValue + 1}/$pages',
                style: kQuestionNavigationTextStyle,
              ),
            );
          },
          valueListenable: currentPage,
        ),
        Spacer(),
        RawMaterialButton(
          padding: EdgeInsetsDirectional.zero,
          onPressed: () {
            if (paginationControl.page == pages + 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendConsent()));
              return;
            }
            paginationControl.nextPage(
                duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
          },
          child: Text('Next',
              textAlign: TextAlign.left, style: kQuestionNavigationTextStyle),
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
    this.multiChoice = false,
  }) : assert(optionTypes.length == labels.length);

  ConsentQuestion.fromJson(Map<String, dynamic> json, this.multiChoice)
      : question = json['question'],
        optionTypes = List<ConsentOptionType>.from(json['optionTypes']),
        labels = json['labels'].cast<String>();

  final String question;
  final List<ConsentOptionType> optionTypes;
  final List<String> labels;
  final bool multiChoice;
  @override
  ConsentQuestionState createState() => ConsentQuestionState();
}

class ConsentQuestionState extends State<ConsentQuestion>
    with AutomaticKeepAliveClientMixin {
  List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(widget.optionTypes.length, (index) => false);
  }

  void responseToTapSingleChoice(int index) {
    setState(() {
      for (int indexBtn = 0; indexBtn < _isSelected.length; indexBtn++) {
        if (indexBtn == index) {
          _isSelected[indexBtn] = true;
        } else {
          _isSelected[indexBtn] = false;
        }
      }
    });
    //TODO: Use index to update storage of question answer.
  }

  void responseToTapMultiChoice(int index) {
    if (index == widget.optionTypes.length - 1) {
      responseToTapSingleChoice(index);
    } else {
      setState(() {
        _isSelected[widget.optionTypes.length - 1] = false;
        _isSelected[index] = !_isSelected[index];
      });
    }
    //TODO: Use index to update storage of question answer.
  }

  buildButtons(int index) {
    return ConsentOptionButton(
      type: widget.optionTypes[index],
      selected: _isSelected[index],
      responseTap: widget.multiChoice
          ? () {
              responseToTapMultiChoice(index);
            }
          : () {
              responseToTapSingleChoice(index);
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
            style: kConsentQuestionTextStyle,
          ),
          Row(
            children: List.generate(
                widget.optionTypes.length, (index) => buildButtons(index)),
          ),
          SizedBox(height: 28),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
