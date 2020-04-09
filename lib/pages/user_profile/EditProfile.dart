import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/LocalKeyValuePersistence.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';
import 'package:grade_plus_plus/entities/user/Teacher.dart';

import '../../Router.dart';
import '../../entities/user/UserData.dart';
import '../AbstractPage.dart';
import '../fragments/BlankPadding.dart';
import '../fragments/SelectionMenu.dart';
import '../fragments/StyledText.dart';

class EditProfile extends AbstractPage {
  EditProfile(
      {Key key,
      @required this.data,
      @required this.courses,
      @required this.teachers})
      : super(
          key: key,
          appBarTitle: 'Edit Profile',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
        );

  final UserData data;
  final HashMap<String, Course> courses;
  final HashMap<String, Teacher> teachers;

  // TODO: make these sets dynamic

  final myCourses = {
    "Linear Algebra",
    "Astronomy",
    "Nuclear Reactions",
    "Counting Sheep",
  };

  final subjects = {
    "Linear Algebra",
    "Astronomy",
    "Nuclear Reactions",
    "Counting Sheep",
  };

  final myTeachers = {
    "Mr Bean",
    "John Smith",
    "Jon Snow",
  };

  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends PageState<EditProfile> {
  TextEditingController nameController;
  Set<String> selectedCourses;
  Set<String> favSubjects;
  Set<String> favTeachers;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data.name);
    selectedCourses = {};
    favSubjects = widget.data.favSubjects.toSet();
    favTeachers = widget.data.favTeachers.toSet();

    widget.myCourses.removeAll(selectedCourses);
    widget.subjects.removeAll(favSubjects);
    widget.myTeachers.removeAll(favTeachers);
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      children: <Widget>[
        _buildSelectCourses(),
        _buildSelectFavSubjects(),
        _buildSelectFavTeachers(),
        _buildChangeName(),
        _buildSaveButton(),
        BlankPadding(),
      ],
    );
  }

  Widget _buildSelectCourses() {
    return SelectionMenu(
      sectionTitle: "Select your current courses",
      sectionIcon: Icons.library_add,
      fullIcon: Icons.bookmark,
      emptyIcon: Icons.bookmark_border,
      selection: selectedCourses,
      options: widget.myCourses,
    );
  }

  Widget _buildSelectFavSubjects() {
    return SelectionMenu(
      sectionTitle: "Select your favorite subjects",
      sectionIcon: Icons.stars,
      fullIcon: Icons.favorite,
      emptyIcon: Icons.favorite_border,
      selection: favSubjects,
      options: widget.subjects,
    );
  }

  Widget _buildSelectFavTeachers() {
    return SelectionMenu(
      sectionTitle: "Select your favorite teachers",
      sectionIcon: Icons.group_add,
      fullIcon: Icons.person,
      emptyIcon: Icons.person_outline,
      selection: favTeachers,
      options: widget.myTeachers,
    );
  }

  Widget _buildChangeName() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StyledText(
            "Change your name:",
            size: 18,
          ),
          BlankPadding(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent.withOpacity(0.1),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return MaterialButton(
      child: Text("SAVE"),
      textColor: Colors.white,
      color: Colors.blueAccent,
      onPressed: () {
        String name = nameController.value.text;
        if (name.isEmpty) {
          // handle error
          return;
        }
        widget.data.name = name;

        widget.data.favSubjects.clear();
        widget.data.favSubjects.addAll(favSubjects);

        widget.data.favTeachers.clear();
        widget.data.favTeachers.addAll(favTeachers);

        LocalKeyValuePersistence.setUserData(widget.data);
        Router.pop(context);
      },
    );
  }
}
