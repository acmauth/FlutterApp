import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_plus_plus/entities/course/Course.dart';

import '../../Router.dart' as nav;
import '../../bloc/search/exports.dart';
import '../AbstractPage.dart';
import '../fragments/SearchBar.dart';

class Search extends AbstractPage {
  Search({Key key, @required this.courses})
      : super(
          key: key,
          appBarTitle: "Search",
          navIcon: Icons.search,
        );

  final Map<String, Course> courses;

  _SearchState createState() => _SearchState();
}

class _SearchState extends PageState<Search> {
  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    Map<String, String> searchMap = new Map();
    widget.courses
        .forEach((id, course) => searchMap.putIfAbsent(course.title, () => id));
    return SearchBar(
      searchSet: searchMap.keys.toSet(),
      onTap: (str) {
        BlocProvider.of<SearchBloc>(context).add(CourseTapEvent(str, true));
        nav.Router.push(context, '/course',
            args: widget.courses[searchMap[str]]);
      },
    );
  }
}
