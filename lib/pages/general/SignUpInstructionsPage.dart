import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/fragments/StyledText.dart';

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
    'signup_instructions1.png',
    'signup_instructions2.png',
    'signup_instructions3.png',
    'signup_instructions4.png',
    'signup_instructions5.png',
    'signup_instructions6.png',
  ];

  final List<String> descriptionsList = [
    'Visit https://sis.auth.gr/old and login with your academic account.',
    'Click on the top left menu button.',
    'Click the second choice ( Βαθμολογία ) available on the menu.',
    'Click again the second choice ( Αναλυτική ) available on the new menu that popped up.',
    'On the page that was loaded click the first pdf icon ( Εκτύπωση αναλυτικής βαθμολογίας σε pdf ). A pdf file with your grades will be downloaded.',
    'You are ready! You can now select the downloaded pdf file in the third stage of our app\'s signup process and let us help you improve your grades in the upcoming semesters!',
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
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/' + imgList[imgIndex],
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
            description: descriptionsList[imgIndex],
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 47.5, right: 47.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (imgIndex != 0)
                  TextButton(
                    onPressed: _previousImage,
                    child: Text(
                      'Prev',
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
                  )
                else
                  SizedBox(),
                if (imgIndex != imgList.length - 1)
                  TextButton(
                    onPressed: _nextImage,
                    child: Text(
                      'Next',
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
                  )
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
      imgIndex = imgIndex > 0 ? imgIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      imgIndex = imgIndex < imgList.length - 1 ? imgIndex + 1 : imgIndex;
    });
  }
}

class DotsRow extends StatelessWidget {
  final int numberOfDots;
  final int imgIndex;

  DotsRow({this.numberOfDots, this.imgIndex});

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 2.0,
          right: 2.0,
        ),
        child: Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4.0),
            )),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue,
                  spreadRadius: 0.0,
                  blurRadius: 2.0,
                )
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; i++)
      dots.add(i == imgIndex ? _activePhoto() : _inactivePhoto());

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}

class InstructionsStepDescription extends StatelessWidget {
  final int imgIndex;
  final String description;

  InstructionsStepDescription({this.imgIndex, this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StyledText(
            'Step ' + (imgIndex + 1).toString(),
            size: 30.0,
            weight: FontWeight.values[5],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
              right: 35.0,
            ),
            child: StyledText(
              description,
              align: TextAlign.center,
              size: 18.0,
              weight: FontWeight.values[4],
            ),
          )
        ],
      ),
    );
  }
}
