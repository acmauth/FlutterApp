import 'package:flutter/material.dart';

import '../../entities/course/PassedCourseData.dart';
import '../../entities/user/SemesterData.dart';
import '../../entities/user/UserData.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/ExpandableSection.dart';
import '../fragments/ItemContainer.dart';
import '../fragments/StyledText.dart';
import 'package:grade_plus_plus/pages/user_profile/editProfile.dart';

class UserProfile extends AbstractPage {
  UserProfile({
    Key key,
    @required this.userData,
  }) : super(
          key: key,
          appBarTitle: 'Profile',
          navIcon: Icons.person,
        );

  final UserData userData;

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends PageState<UserProfile> {
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
        ),
        StyledText(
          "${widget.userData.schoolData.department} Department",
          size: 12,
        ),
        BlankPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledText(
              "Current Semester: ",
              weight: FontWeight.bold,
            ),
            StyledText(
              "${widget.userData.schoolData.semester}",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledText(
              'Est. year of graduation: ',
              weight: FontWeight.bold,
            ),
            StyledText(
              "${widget.userData.estYear}",
            ),
          ],
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.blue
              )
          ),
          color: Colors.white,
          textColor: Colors.blue,
          child: Text("Edit"),
          onPressed: (){
            Navigator.push(context,
                new MaterialPageRoute(
                builder: (__) => new editProfile( userData: widget.userData,))
            );
          },
        )
      ],
    );
  }

  Container _buildFavSubjects() {
    return ItemContainer(
      title: "Favorite Subjects",
      color: Colors.lightBlue.withOpacity(0.1),
      items: widget.userData.favSubjects
          .map((String subj) => Container(
                child: StyledText(subj),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ))
          .toList(),
    );
  }

  Container _buildFavTeachers() {
    return ItemContainer(
      title: "Favorite Teachers",
      items: widget.userData.favTeachers
          .map((String subj) => Container(
                child: StyledText(subj),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ))
          .toList(),
    );
  }

  Column _buildGradeList() {
    return Column(
      children: widget.userData.semesterDataList
          .map((SemesterData semester) => Column(
                children: <Widget>[
                  ExpandableSection(
                    title: "Semester #${semester.id}",
                    barColor: Colors.lightBlue
                        .withOpacity(semester.id % 2 == 0 ? 0.08 : 0.12),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    fillContentBg: false,
                    content: Column(
                      children: semester.courseDataList.map((PassedCourseData course) => Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.05),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      course.baseData.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(course.baseData.teacher),
                                    BlankPadding(),
                                    Text("Grade: ${course.grade}"),
                                    Text("Year: ${course.year}"),
                                  ],
                                ),
                              )).toList(),
                    ),
                  ),
                  BlankPadding(),
                ],
              ))
          .toList(),
    );
  }
}
