import 'package:flutter/material.dart';
import '../AbstractPage.dart';


class CoursePage extends AbstractPage{
  final String data;

  CoursePage({
    Key key,
    @required this.data,
  }) : super(key: key,
      appBarTitle: 'Course Page',
      appBarColorBg: Colors.blue,
      appBarColorTxt: Colors.white,
      navIcon: Icons.search);

  _CoursePageState createState() => _CoursePageState();
}


class _CoursePageState extends PageState<CoursePage>{

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("TODO")
        ],
      ),
    );
  }

}