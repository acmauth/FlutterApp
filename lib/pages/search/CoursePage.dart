import 'package:flutter/material.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';

import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/StyledText.dart';

class CoursePage extends AbstractPage {
  CoursePage({
    Key key,
    @required this.course,
  }) : super(
          key: key,
          appBarTitle: 'Course Page',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
          navIcon: Icons.search,
        );

  final Course course;

  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends PageState<CoursePage> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          _buildBox(
            Colors.lightBlue,
            <Widget>[
              StyledText(
                widget.course.title,
                size: 25,
                weight: FontWeight.bold,
              ),
              StyledText(widget.course.code),
              _normalText(
                "${_getSemester(widget.course.period)} Semester, Year ${widget.course.courseClass.year}",
              ),
              BlankPadding(),
              _normalText("Teachers: ${widget.course.courseClass.teachers.join(', ')}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: StyledText(
                  widget.course.courseExtra.goal,
                  size: 14,
                ),
              ),
              _headerText("Content:"),
              _buildPadded(widget.course.courseExtra.content),
              BlankPadding(),
              _normalText(
                "ERASMUS: ${widget.course.courseExtra.erasmus ? " AVAILABLE" : " NOT AVAILABLE"}",size: 14
              ),
            ],
          ),
          BlankPadding(),
          _buildBox(
            Colors.grey,
            <Widget>[
              StyledText(
                "Prerequisites and Assessment",
                size: 20,
                weight: FontWeight.bold,
              ),
              Divider(height: 20),
              _normalText("Courses:"),
              _buildPadded(widget.course.courseExtra.preCourses),
              BlankPadding(),
              _normalText("Knowledge:"),
              _buildPadded(widget.course.courseExtra.preKnowledge),
              BlankPadding(),
              _normalText(widget.course.courseExtra.assessDesc),
              BlankPadding(),
              _normalText("Methods of assessment:"),
              _buildPadded(widget.course.courseExtra.assessMethods),
            ],
          ),
        ],
      ),
    );
  }

  String _getSemester(int period) {
    switch (period % 10) {
      case 1:
        return "${period}st";
      case 2:
        return "${period}nd";
      case 3:
        return "${period}rd";
      default:
        return "${period}th";
    }
  }

  StyledText _headerText(String str) {
    return StyledText(str, size: 18);
  }

  StyledText _normalText(String str, {double size=14}) {
    return StyledText(str, size: size, align: TextAlign.left);
  }

  Widget _buildPadded(List<String> content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.map((str) => _normalText("- $str",size:14)).toList(),
      ),
    );
  }

  Container _buildBox(Color color, List<Widget> content) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
