import 'package:flutter/material.dart';

import '../../entities/course/QaCourseData.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/StyledText.dart';

class CoursePage extends AbstractPage {
  CoursePage({
    Key key,
    @required this.data,
  }) : super(
          key: key,
          appBarTitle: 'Course Page',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
          navIcon: Icons.search,
        );

  final QaCourseData data;

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
                widget.data.base.title,
                size: 25,
                weight: FontWeight.bold,
              ),
              StyledText(widget.data.base.code),
              BlankPadding(),
              _normalText(
                "${_getSemester(widget.data.period)} Semester, Year ${widget.data.year}",
              ),
              _normalText("Teachers: ${widget.data.teachers.join(', ')}"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: StyledText(
                  widget.data.goal,
                  size: 20,
                ),
              ),
              _headerText("Content:"),
              _buildPadded(widget.data.content),
              BlankPadding(),
              _normalText(
                "This course is${widget.data.erasmus ? "" : " NOT"} available for Erasmus students.",
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
              _buildPadded(widget.data.preCourses),
              BlankPadding(),
              _normalText("Knowledge:"),
              _buildPadded(widget.data.preKnowledge),
              BlankPadding(),
              _normalText(widget.data.assessDesc),
              BlankPadding(),
              _normalText("Methods of assessment:"),
              _buildPadded(widget.data.assessMethods),
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
        return "{$period}nd";
      case 3:
        return "{$period}rd";
      default:
        return "${period}th";
    }
  }

  StyledText _headerText(String str) {
    return StyledText(str, size: 18);
  }

  StyledText _normalText(String str) {
    return StyledText(str, size: 16);
  }

  Widget _buildPadded(List<String> content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content.map((str) => _normalText("- $str")).toList(),
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
