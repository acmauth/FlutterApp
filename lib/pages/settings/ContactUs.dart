import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends AbstractPage {
  ContactUs({Key key})
      : super(
    key: key,
    appBarTitle: 'Contact us',
    appBarColorBg: Colors.blue,
    appBarColorTxt: Colors.white,
  );

  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends PageState<ContactUs> {

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Form(
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildSuggestButton(),
            _buildBugButton()
          ],
        ),
      ),
    );
  }

  Container _buildHeader(){
    return Container(
      child: Column(
        children: <Widget>[
          Text("Help us improve!", style: TextStyle(fontSize: 26, color: Colors.lightBlueAccent)),
          Image.asset(
            'assets/contact.png',
            height: 300,
            width: 200,
          )
        ],
      )
    );
  }
  Container _buildSuggestButton(){
    return  Container(
      margin: new EdgeInsets.only(bottom: 15),
      width: 220,
      height: 55,
      color: Colors.lightBlueAccent,
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            const Text('Suggest an idea!',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
            )
            ,
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            )
          ],
        ),
        onPressed: () => openMail(true),
      ),
    );
  }

  Container _buildBugButton(){
    return Container(
      width: 220,
      height: 55,
      margin: new EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 1,
            color: Colors.lightBlueAccent,
          )),
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            const Text('Report a bug!',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlueAccent
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
            )
            ,
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        onPressed: () => openMail(false),
      ),
    );
  }

  void openMail(bool isIdea) async {

    String gradeMail = "gradeplusplus@auth.acm.org";

    String subject = "";
    String body = "";

    if(isIdea){
      subject = "New idea suggestion!";
      body = "►What is your idea? <br><br><br><br> ►How is it going to imrpove the app?";
    }
    else{
      subject = "Bug report!";
      body = "►What is the bug? <br><br><br><br> ►On what page did the bug occur? <br><br><br><br> ►Please provide the steps to reproduce below";
    }

    String _url = "mailto:" + gradeMail + "?subject=" + subject + "&body=" + body;

    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch ' + _url;
  }
}
