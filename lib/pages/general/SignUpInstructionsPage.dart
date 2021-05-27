import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/fragments/InstructionsStepDescription.dart';
import 'package:grade_plus_plus/pages/fragments/StyledText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Router.dart' as nav;

// Represents the page that contains the instructions on how to get your grades from sis
class SignUpInstructionsPage extends AbstractPage {
  SignUpInstructionsPage({Key key})
      : super(
          key: key,
          appBarTitle: 'How to upload your grades',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
        );

  _SignUpInstructionsPageState createState() => _SignUpInstructionsPageState();
}

class _SignUpInstructionsPageState extends PageState<SignUpInstructionsPage>
    with TickerProviderStateMixin {
  int imgIndex = 0;
  AnimationController _controller;

  final List<String> imgList = [
    'assets/signup_instructions1.png',
    'assets/signup_instructions2.png',
  ];

  final List<String> descriptionsList = [
    'You are ready! You can now select the downloaded pdf file in the third stage of our app\'s signup process.',
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.repeat(
      reverse: true,
    );
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Theme.of(context).cardColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Center(
            // Image carousel widget
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) => Container(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          imgList[imgIndex],
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    height: 300.0,
                    width: 250.0,
                  ),
                ),
              ),
              options: CarouselOptions(
                  height: 300.0,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    if (index == imgIndex + 1)
                      _nextImage();
                    else
                      _previousImage();
                  }),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          InstructionsStepDescription(
            imgIndex: imgIndex,
            descriptionWidget: (imgIndex != 0)
                ? StyledText(
                    descriptionsList[imgIndex - 1],
                    // use the text from the description list only when the imgIndex is 1
                    // but description list contains only one element so reduce the index by 1
                    align: TextAlign.center,
                    size: 18.0,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StyledText(
                        'Visit ',
                        size: 18.0,
                        align: TextAlign.center,
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Container(
                            child: InkWell(
                                child: Text(
                                  'https://sis.auth.gr/old/el/all_grades.',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Theme.of(context).accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () => launch(
                                    'https://sis.auth.gr/old/el/all_grades')),
                          )),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      StyledText(
                        'Then login with your academic account. Click the pdf icon "Εκτύπωση αναλυτικής βαθμολογίας σε pdf". A pdf file with your grades will be downloaded.',
                        size: 18.0,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: (imgIndex == imgList.length - 1)
                  ? _buildTextButton('Ok', () {
                      nav.Router.pop(context);
                    })
                  : ScaleTransition(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/swipe.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        height: 32.0,
                        width: 32.0,
                      ),
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: _controller, curve: Curves.elasticOut)))),
        ],
      ),
    );
  }

  void _previousImage() {
    setState(() {
      imgIndex--;
    });
  }

  void _nextImage() {
    setState(() {
      imgIndex++;
    });
  }

  TextButton _buildTextButton(text, callback) {
    return TextButton(
      onPressed: callback,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.values[5],
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
    );
  }
}
