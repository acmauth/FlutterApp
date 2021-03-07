import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/Router.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';
import 'package:grade_plus_plus/entities/user/Teacher.dart';

import '../../entities/user/UserData.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/ItemContainer.dart';
import '../fragments/StyledText.dart';

class UserProfile extends AbstractPage {
  UserProfile({
    Key key,
    @required this.userData,
    @required this.courses,
    @required this.teachers,
  }) : super(
          key: key,
          appBarTitle: 'Profile',
          navIcon: Icons.person,
        );

  final UserData userData;
  final HashMap<String, Course> courses;
  final HashMap<String, Teacher> teachers;

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends PageState<UserProfile> {
  List<Container> _none = [Container(child: Text("None."))];

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      children: <Widget>[
        _buildUserBio(),
        BlankPadding(),
        _buildFavSubjects(),
        _buildFavTeachers(),
        _buildGradeList(),
      ],
    );
  }

  Column _buildUserBio() {
    return Column(
      children: <Widget>[
        BlankPadding(),
        CircleAvatar(
          backgroundColor: Colors.lightBlue.shade100,
          backgroundImage: NetworkImage(
              'http://aux2.iconspalace.com/uploads/manager-icon-256.png'),
          radius: 32,
        ),
        BlankPadding(),
        StyledText(
          widget.userData.name,
          weight: FontWeight.bold,
          color: Theme.of(context).textTheme.body1.color,
        ),
        StyledText("${widget.userData.schoolData.school} Department",
            size: 12, color: Theme.of(context).textTheme.body1.color),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledText("Semester: ",
                weight: FontWeight.bold,
                color: Theme.of(context).textTheme.body1.color),
            StyledText("${widget.userData.semester}",
                color: Theme.of(context).textTheme.body1.color),
          ],
        ),
        BlankPadding(),
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text('Edit Profile'),
          onPressed: () {
            Router.push(context, '/edit_profile', args: {
              'data': widget.userData,
              'courses': widget.courses,
              'teachers': widget.teachers
            });
          },
        )
      ],
    );
  }

  Container _buildFavSubjects() {
    var subjects = widget.userData.favSubjects.isEmpty
        ? _none
        : widget.userData.favSubjects
            .map((String subj) => Container(
                  child: StyledText(subj,color: Theme.of(context).textTheme.body1.color),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color:Theme.of(context).textTheme.body1.color),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ))
            .toList();

    return ItemContainer(
      title: "Favorite Subjects",
      bgColor: Theme.of(context).cardColor,
      textColor: Theme.of(context).textTheme.body1.color,

      items: subjects,
    );
  }

  Container _buildFavTeachers() {
    var teachers = widget.userData.favTeachers.isEmpty
        ? _none
        : widget.userData.favTeachers
            .map((String subj) => Container(
                  child: StyledText(subj, color:Theme.of(context).textTheme.body1.color),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).textTheme.body1.color),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ))
            .toList();
    return ItemContainer(
        title: "Favorite Teachers",
        items: teachers,
        textColor: Theme.of(context).textTheme.body1.color,
    );
  }

  Column _buildGradeList() {
    return Column();
//    return Column(
//      children: widget.userData.semesterDataList
//          .map((SemesterData semester) => Column(
//                children: <Widget>[
//                  ExpandableSection(
//                    title: "Semester #${semester.id}",
//                    barColor: Colors.lightBlue
//                        .withOpacity(semester.id % 2 == 0 ? 0.08 : 0.12),
//                    padding: EdgeInsets.symmetric(horizontal: 30),
//                    fillContentBg: false,
//                    content: Column(
//                      children: semester.courseDataList
//                          .map((PassedCourseData course) => Container(
//                                margin: EdgeInsets.only(top: 20),
//                                padding: EdgeInsets.all(20),
//                                decoration: BoxDecoration(
//                                  color: Colors.grey.withOpacity(0.05),
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(5)),
//                                ),
//                                child: Column(
//                                  crossAxisAlignment:
//                                      CrossAxisAlignment.stretch,
//                                  children: <Widget>[
//                                    Text(
//                                      course.baseData.title,
//                                      style: TextStyle(
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                    Text(course.baseData.teacher),
//                                    BlankPadding(),
//                                    Text("Grade: ${course.grade}"),
//                                    Text("Year: ${course.year}"),
//                                  ],
//                                ),
//                              ))
//                          .toList(),
//                    ),
//                  ),
//                  BlankPadding(),
//                ],
//              ))
//          .toList(),
//    );
  }
}
