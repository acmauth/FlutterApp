import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/DataFetcher.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';

import '../../Router.dart';
import '../../bloc/search/exports.dart';
import '../../entities/course/BaseCourseData.dart';
import '../../entities/course/CourseDifficulty.dart';
import '../../entities/course/QaCourseData.dart';
import '../AbstractPage.dart';
import '../fragments/SearchBar.dart';

class Search extends AbstractPage {
  Search({Key key,
  @required this.courses})
      : super(
          key: key,
          appBarTitle: "Search",
          navIcon: Icons.search,
        );

  final Map<String,Course> courses;



  _SearchState createState() => _SearchState();
}

class _SearchState extends PageState<Search>{
//  final history = Set<String>();
//  final searchMap = {
//    "Linear Algebra 2": "ABC-01-01",
//    "Algebra 1": "BXY-01-01",
//    "Discrete Maths": "ADS-01-01",
//    "Advanced Maths": "CXZ-01-01",
//    "Software Engineering": "AAA-22-22",
//    "ΕΝΑ": "BBA-01-61",
//  };


  Course _getData(String str, String code) {
      return widget.courses[code];
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    Map<String,String> searchMap = new Map();
    widget.courses.forEach(
            (id, course) => searchMap.putIfAbsent(course.title, () => id));
    return SearchBar(
      searchSet: searchMap.keys.toSet(),
      onTap: (str) {
        BlocProvider.of<SearchBloc>(context).add(CourseTapEvent(str,true));
        Router.push(context, '/course', args: _getData(str, searchMap[str]));
      },
    );
  }
}
