import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/SearchList.dart';

import '../../Router.dart';
import '../AbstractPage.dart';

class Search extends AbstractPage {
  Search({Key key})
      : super(
    key: key,
    appBarTitle: 'Search',
    navIcon: Icons.search,
  );

  _SearchState createState() => _SearchState();
}

class _SearchState extends PageState<Search> {


  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  final key = new GlobalKey<ScaffoldState>();
 // static TextEditingController _searchQuery = new TextEditingController();

  List<String> courseList = List();
  List<String> historyList = new List();

  _SearchState() {
    initCourseList();
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return SearchList(
      mapTile: (contact) => new ChildItem(contact, false, historyList),
      // TODO handle history in fragment
      courselist: courseList,
      onEmpty: buildhistoryList,
    );

  }

   void initCourseList() {
    courseList.add("ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ Ι");
    courseList.add("ΕΙΣΑΓΩΓΗ ΣΤΗΝ ΠΛΗΡΟΦΟΡΙΚΗ");
    courseList.add("ΓΡΑΜΜΙΚΗ ΑΛΓΕΒΡΑ");
    courseList.add("ΔΙΑΚΡΙΤΑ ΜΑΘΗΜΑΤΙΚΑ");
    courseList.add("ΒΑΣΙΚΕΣ ΑΡΧΕΣ ΠΡΟΓΡΑΜΜΑΤΙΣΜΟΥ");
    courseList.add("ΜΑΘΗΜΑΤΙΚΗ ΑΝΑΛΥΣΗ ΙΙ");
    courseList.add("ΠΙΘΑΝΟΤΗΤΕΣ & ΣΤΑΤΙΣΤΙΚΗ");
    courseList.add("ΔΟΜΕΣ ΔΕΔΟΜΕΝΩΝ");
    courseList.add("ΨΗΦΙΑΚΗ ΣΧΕΔΙΑΣΗ");
    courseList.add("ΘΕΩΡΙΑ ΥΠΟΛΟΓΙΣΜΟΥ");
  }

  List<ChildItem> buildhistoryList(){
    return historyList.map(
            (contact) => new ChildItem(contact,
            true,
            historyList,
            onDelete: () => removeItem(contact))).toList();
  }
  List<ChildItem> buildFullList(){
    return courseList.map(
            (contact) => new ChildItem(contact,
            false,
            historyList,
            onDelete: () => removeItem(contact))).toList();
  }

  void removeItem(String name){
    setState(() {
      historyList.remove(name);
    });
  }

}


class ChildItem extends StatelessWidget {
  final String name;
  final VoidCallback onDelete;

  final bool wasClicked;
  final List<String> history;

  ChildItem(this.name, this.wasClicked, this.history, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.lightBlueAccent))),
            child: Icon(wasClicked ? Icons.history : Icons.library_books)
        ),
        title: new Text(this.name),
        subtitle: new Text("1st Semester"),
        onTap: () {
          if(!history.contains(this.name)){
            history.add(this.name);
          }
          openCourseInfo(context);
        },

        trailing: IconButton(
          icon: Icon(wasClicked ? Icons.close : Icons.keyboard_arrow_right,),
          onPressed: this.onDelete,
        )
    );
  }

  void openCourseInfo(BuildContext context){
    Router.push(context, '/CoursePage');
  }

}


