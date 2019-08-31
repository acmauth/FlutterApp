import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/AbstractPage.dart';
import 'package:grade_plus_plus/pages/course_suggest/exports.dart';
import 'package:grade_plus_plus/pages/fragments/exports.dart';

class CourseSuggest extends AbstractPage {
  CourseSuggest({
    Key key,
    SemesterData semester,
    List<CourseData> courses,
  }) : super(
          key: key,
          appBarTitle: "Course Suggestion",
          content: Column(
            children: <Widget>[
              _buildSchoolInfo(semester),
              _buildSuggestionList(courses),
            ],
          ),
          navItem: BottomNavigationBarItem(
            icon: new Icon(Icons.check_circle),
            title: Text("Courses"),
          ),
        );
}

Column _buildSchoolInfo(SemesterData data) {
  return Column(
    children: <Widget>[
      BlankPadding(),
      StyledText(
        text: data.school,
        size: 18,
      ),
      StyledText(
        text: "${data.semester}th Semester",
        size: 16,
      ),
      BlankPadding(),
      StyledText(
        text: 'We suggest to you:',
        color: Colors.blueAccent.withOpacity(0.75),
      ),
      BlankPadding(),
    ],
  );
}

Widget _buildSuggestionList(List<CourseData> data) {
  final Iterable<Column> courses = data.map(
    (CourseData course) => Column(
      children: <Widget>[
        ExpandableSection(
          title: course.title,
          subtitle: course.code,
          extras: StyledText(
            text: "${course.match}%",
            size: 16,
            weight: FontWeight.bold,
            color: Colors.blue, // _getMatchColor(course.match),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StyledText(text: 'Taught by:'),
              StyledText(
                text: course.teacher,
                size: 12,
              ),
              BlankPadding(),
              StyledText(text: "Average Grade: ${course.averageGrade}"),
              Row(
                children: <Widget>[
                  StyledText(text: 'Difficulty: '),
                  StyledText(
                    text: _getDifficultyText(course.difficulty),
                    color: _getDifficultyColor(course.difficulty),
                  ),
                ],
              ),
              Container(
                child: course.favTeacher
                    ? Column(
                        children: <Widget>[
                          BlankPadding(),
                          Divider(),
                          BlankPadding(),
                          StyledText(
                            text:
                                "${course.teacher} is in your list of favorite teachers!",
                            size: 12,
                            color: Colors.blueAccent,
                          ),
                        ],
                      )
                    : null,
              ),
            ],
          ),
        ),
        BlankPadding(),
      ],
    ),
  );

  return Column(
    children: courses.toList(),
  );
}

Color _getMatchColor(int match) {
  if (match > 80) {
    return Colors.greenAccent;
  } else if (match > 60) {
    return Colors.orangeAccent;
  }
  return Colors.redAccent;
}

String _getDifficultyText(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return "Easy";
    case CourseDifficulty.MEDIUM:
      return "Medium";
    default:
      return "Hard";
  }
}

Color _getDifficultyColor(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return Colors.green;
    case CourseDifficulty.MEDIUM:
      return Colors.orange;
    default:
      return Colors.red;
  }
}
