import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:grade_plus_plus/DataFetcher.dart';
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
  EditProfile({
    Key key,
    @required this.data,
    @required this.courses,
    @required this.teachers,
  }) : super(
          key: key,
          appBarTitle: 'Edit Profile',
          appBarColorBg: Colors.blue,
          appBarColorTxt: Colors.white,
        );

  final UserData data;
  final HashMap<String, Course> courses;
  final HashMap<String, Teacher> teachers;

  final Set<String> courseOptions = {};
  final Set<String> favSubjectOptions = {};
  final Set<String> favTeacherOptions = {};

  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends PageState<EditProfile> {
  TextEditingController nameController;
  GlobalKey<FormFieldState> nameKey;

  HashMap<String, String> coursesToIds;
  HashMap<String, String> teachersToIds;

  Set<String> selectedCourses;
  Set<String> favSubjects;
  Set<String> favTeachers;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data.name);
    nameKey = GlobalKey<FormFieldState<dynamic>>();

    coursesToIds = HashMap();
    teachersToIds = HashMap();

    selectedCourses = {};
    favSubjects = widget.data.favSubjects.toSet();
    favTeachers = widget.data.favTeachers.toSet();

    widget.courses.values.forEach((course) {
      var name = course.title;
      widget.courseOptions.add(name);
      coursesToIds[name] = course.id;
      if (!favSubjects.contains(name)) {
        widget.favSubjectOptions.add(name);
      }
    });

    widget.teachers.values.forEach((teacher) {
      var name = teacher.name;
      teachersToIds[name] = teacher.id;
      if (!favTeachers.contains(name)) {
        widget.favTeacherOptions.add(name);
      }
    });
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
      children: <Widget>[
        _buildSelectCourses(),
        _buildSelectFavSubjects(),
        _buildSelectFavTeachers(),
        _buildChangeName(),
        _buildSaveButton(scfKey),
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
      options: widget.courseOptions,
    );
  }

  Widget _buildSelectFavSubjects() {
    return SelectionMenu(
      sectionTitle: "Select your favorite subjects",
      sectionIcon: Icons.stars,
      fullIcon: Icons.favorite,
      emptyIcon: Icons.favorite_border,
      selection: favSubjects,
      options: widget.favSubjectOptions,
    );
  }

  Widget _buildSelectFavTeachers() {
    return SelectionMenu(
      sectionTitle: "Select your favorite teachers",
      sectionIcon: Icons.group_add,
      fullIcon: Icons.person,
      emptyIcon: Icons.person_outline,
      selection: favTeachers,
      options: widget.favTeacherOptions,
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
            child: TextFormField(
              key: nameKey,
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              validator: (v) => v.trim() == "" ? "Please fill your name" : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(GlobalKey<ScaffoldState> scfKey) {
    return MaterialButton(
      child: Text("SAVE"),
      textColor: Colors.white,
      color: Colors.blueAccent,
      onPressed: () async {
        if (nameKey.currentState.validate()) {
          String name = nameController.value.text;
          bool updateName = name != widget.data.name;
          widget.data.name = name;

          // TODO: do something with selected courses

          widget.data.favSubjects.clear();
          widget.data.favSubjects.addAll(favSubjects);

          widget.data.favTeachers.clear();
          widget.data.favTeachers.addAll(favTeachers);

          LocalKeyValuePersistence.setUserData(widget.data);

          var nameSuccess = true;
          var subjectSuccess = true;
          var teacherSuccess = true;
          if (updateName) {
            nameSuccess = await DataFetcher.updateName(name);
          }

          subjectSuccess =
              await DataFetcher.updateSubjects(mapCourses(favSubjects));
          teacherSuccess =
              await DataFetcher.updateTeachers(mapTeachers(favTeachers));

          if ((updateName && nameSuccess) || subjectSuccess || teacherSuccess) {
            // partial success so far.
            if (nameSuccess && subjectSuccess && teacherSuccess) {
              // full success
              showSnack(scfKey, "Success!", Colors.lightGreen, 1);
            } else {
              // at least 1 failure
              var failed = [];
              if (updateName && !nameSuccess) {
                failed.add("Name");
              }
              if (!subjectSuccess) {
                failed.add("Favorite Subjects");
              }
              if (!teacherSuccess) {
                failed.add("Favorite Teachers");
              }
              showSnack(
                scfKey,
                "The following fields failed to save:\n${failed.join(", ")}",
                Colors.orange,
                5,
              );
            }
          }
        }
      },
    );
  }

  Set<String> mapCourses(Set<String> names) {
    return names.map((n) => coursesToIds[n]).toSet();
  }

  Set<String> mapTeachers(Set<String> names) {
    return names.map((n) => teachersToIds[n]).toSet();
  }

  void showSnack(
    GlobalKey<ScaffoldState> scfKey,
    String txt,
    Color color,
    int duration,
  ) {
    scfKey.currentState.showSnackBar(
      SnackBar(
        content: Text(txt),
        backgroundColor: color,
      ),
    );
    Future.delayed(Duration(seconds: duration), () => Router.pop(context));
  }
}
