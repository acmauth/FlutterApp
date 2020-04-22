import 'package:flutter/material.dart';
import 'package:grade_plus_plus/entities/user/UserData.dart';

import '../../entities/course/CourseDifficulty.dart';
import '../../entities/course/SuggestedCourseData.dart';
import '../../entities/user/SchoolData.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/ExpandableSection.dart';
import '../fragments/StyledText.dart';

class CourseSuggest extends AbstractPage {
  CourseSuggest({
    Key key,
    @required this.userData,
    @required this.suggestedCourses,
  }) : super(
          key: key,
          appBarTitle: 'Course Suggestion',
          navIcon: Icons.event_note,
        );

  final UserData userData;
  final List<SuggestedCourseData> suggestedCourses;

  _CourseSuggestState createState() => _CourseSuggestState();
}

class _CourseSuggestState extends PageState<CourseSuggest> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      children: <Widget>[
        buildMessage(),
       // _buildSchoolInfo(widget.userData.schoolData),
       // _buildSuggestionList(widget.suggestedCourses),
      ],
    );
  }
}

Container buildMessage(){
  return Container(
    padding: EdgeInsets.only(top: 100),
    child: Column(
      children: <Widget>[
        BlankPadding(),
        Image.asset(
          'assets/warning.png',
          height: 150,
          width: 150,
        ),
        BlankPadding(),
        StyledText(
          "Under Construction",
          size: 18,
        )
      ],
    ),
  );
}


/*
Column _buildSchoolInfo(SchoolData data) {
  return Column(
    children: <Widget>[
      BlankPadding(),
      StyledText(
        data.department,
        size: 18,
      ),
      StyledText(
        "${data.semester}th Semester",
        size: 16,
      ),
      BlankPadding(),
      StyledText(
        'We suggest to you:',
        color: Colors.blue.withOpacity(0.75),
      ),
      BlankPadding(),
    ],
  );
}

Widget _buildSuggestionList(List<SuggestedCourseData> data) {
  final Iterable<Column> courses = data.map(
    (SuggestedCourseData course) => Column(
      children: <Widget>[
        ExpandableSection(
          title: course.baseData.title,
          subtitle: course.baseData.code,
          extras: StyledText(
            "${course.match}%",
            size: 16,
            weight: FontWeight.bold,
            color: _getMatchColor(course.match),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StyledText('Taught by:'),
              StyledText(
                course.baseData.teacher,
                size: 12,
              ),
              BlankPadding(),
              StyledText(
                "Average Grade: ${course.baseData.averageGrade}",
              ),
              Row(
                children: <Widget>[
                  StyledText('Difficulty: '),
                  StyledText(
                    _getDifficultyText(course.baseData.difficulty),
                    color: _getDifficultyColor(course.baseData.difficulty),
                  ),
                ],
              ),
              if (course.favTeacher)
                Column(
                  children: <Widget>[
                    BlankPadding(),
                    Divider(),
                    BlankPadding(),
                    StyledText(
                      "${course.baseData.teacher} is in your list of favorite teachers!",
                      size: 12,
                      color: Colors.blueAccent,
                    ),
                  ],
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
  /* 
   * Disabled mutliple text colors for aesthetic reasons.
   * If it seems better to you, feel free to re-enable.
   */
  return Colors.blue;
  // if (match > 80) {
  //   return Colors.greenAccent;
  // } else if (match > 60) {
  //   return Colors.orangeAccent;
  // }
  // return Colors.redAccent;
}

String _getDifficultyText(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return "Easy";
    case CourseDifficulty.MEDIUM:
      return "Medium";
    case CourseDifficulty.HARD:
      return "Hard";
    default:
      return "Unmapped value";
  }
}

Color _getDifficultyColor(CourseDifficulty difficulty) {
  switch (difficulty) {
    case CourseDifficulty.EASY:
      return Colors.green;
    case CourseDifficulty.MEDIUM:
      return Colors.orange;
    case CourseDifficulty.HARD:
      return Colors.red;
    default:
      return Colors.black;
  }
}
*/