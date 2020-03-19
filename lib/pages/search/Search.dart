import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Router.dart';
import '../../bloc/search/exports.dart';
import '../../entities/course/BaseCourseData.dart';
import '../../entities/course/CourseDifficulty.dart';
import '../../entities/course/QaCourseData.dart';
import '../AbstractPage.dart';
import '../fragments/SearchBar.dart';

class Search extends AbstractPage {
  Search({Key key})
      : super(
          key: key,
          appBarTitle: "Search",
          navIcon: Icons.search,
        );

  _SearchState createState() => _SearchState();
}

class _SearchState extends PageState<Search> {
//  final history = Set<String>();
  final searchMap = {
    "Linear Algebra": "ABC-01-01",
    "Algebra 1": "BXY-01-01",
    "Discrete Maths": "ADS-01-01",
    "Advanced Maths": "CXZ-01-01",
    "Software Engineering": "AAA-22-22",
    "Astrology": "BBA-01-61",
  };

  QaCourseData _getData(String str, String code) {
    return QaCourseData(
      base: BaseCourseData(
        title: str,
        code: code,
        teacher: "Some teacher",
        averageGrade: 8.2,
        difficulty: CourseDifficulty.EASY,
      ),
      period: 6,
      year: "2019 - 2020",
      teachers: ["Main Teacher", "Substitute"],
      erasmus: false,
      goal: "The goal of this subject is to exist...",
      content: ["Programming", "Speaking", "Breathing"],
      assessDesc: "You are graded based on how tall you are.",
      assessMethods: [
        "Height taken by computer vision tools",
        "Guesstimate by proessor",
        "Team project",
      ],
      preCourses: ["Signal Processing", "Trigonometry"],
      preKnowledge: ["Swimming", "Simple arithmetic"],
    );
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return SearchBar(
      searchSet: searchMap.keys.toSet(),
      onTap: (str) {
        BlocProvider.of<SearchBloc>(context).add(CourseTapEvent(str,true));
        Router.push(context, '/course', args: _getData(str, searchMap[str]));
      },
    );
  }
}
