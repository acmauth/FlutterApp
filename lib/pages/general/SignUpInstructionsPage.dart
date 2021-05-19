import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/fragments/InstructionsStepDescription.dart';
import 'package:grade_plus_plus/pages/fragments/DotsRow.dart';
import 'package:grade_plus_plus/pages/fragments/StyledText.dart';
import 'package:url_launcher/url_launcher.dart';

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

class _SignUpInstructionsPageState extends PageState<SignUpInstructionsPage> {
  int imgIndex = 0;

  final List<String> imgList = [
    'assets/signup_instructions1.png',
    'assets/signup_instructions2.png',
  ];

  final List<String> descriptionsList = [
    'Visit https://sis.auth.gr/old and login with your academic account. Click the pdf icon "Εκτύπωση αναλυτικής βαθμολογίας σε pdf". A pdf file with your grades will be downloaded.',
    'You are ready! You can now select the downloaded pdf file in the third stage of our app\'s signup process.',
  ];

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.white.withOpacity(0.20),
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
            // Image and dots row stack widget
            child: Stack(
              children: <Widget>[
                Container(
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
                Positioned(
                  top: 275.0,
                  left: 15.0,
                  right: 15.0,
                  child: DotsRow(
                    numberOfDots: imgList.length,
                    imgIndex: imgIndex,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          InstructionsStepDescription(
            imgIndex: imgIndex,
            descriptionWidget: (imgIndex != 0)
                ? StyledText(
                    descriptionsList[imgIndex],
                    align: TextAlign.center,
                    size: 18.0,
                    weight: FontWeight.values[4],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: <Widget>[
                          StyledText(
                            'Visit ',
                            size: 18.0,
                            weight: FontWeight.values[4],
                          ),
                          InkWell(
                              child:
                                  Text('https://sis.auth.gr/old/el/all_grades.',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.values[4],
                                        color: Theme.of(context).accentColor,
                                        decoration: TextDecoration.underline,
                                      )),
                              onTap: () => launch(
                                  'https://sis.auth.gr/old/el/all_grades')),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      StyledText(
                        'Then login with your academic account. Click the pdf icon "Εκτύπωση αναλυτικής βαθμολογίας σε pdf". A pdf file with your grades will be downloaded.',
                        size: 18.0,
                        weight: FontWeight.values[4],
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: 15.0,
          ),
          // Buttons row
          Padding(
            padding: const EdgeInsets.only(left: 47.5, right: 47.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (imgIndex != 0)
                  _buildTextButton('Prev', _previousImage)
                else
                  SizedBox(),
                if (imgIndex != imgList.length - 1)
                  _buildTextButton('Next', _nextImage)
                else
                  SizedBox(),
              ],
            ),
          )
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
          fontSize: 25.0,
          fontWeight: FontWeight.values[2],
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 0.0),
              blurRadius: 1.5,
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ],
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.blue,
      ),
    );
  }
}
