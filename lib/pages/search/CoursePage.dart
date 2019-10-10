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
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.lightBlue[50],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Artificial Intelligence",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 2.0,),
                Text("Code: NCO-04-02\n\nProffesor: \n\nTeaching: Ioannis Vlahavas, Dimitris Vrakas\n\n6th Semester\n\nYear: 2019",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[600]
                    )
                ),
              ],
            ),
          ),
        ),//Main info

        Container(
            margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[100],
            ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Extra Information",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold
                    )
                ),
                Text("Erasmus: Available\n\nPrerequirements:\n\t\t-Courses:\n\t\t-Knowledge: \n\nCourse Description:",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[600]
                    )
                )
              ],
            ),
        ),
        )//Minor info
      ],
    );
  }
}
