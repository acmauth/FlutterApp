import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/user_profile/addFavorite.dart';
import '../AbstractPage.dart';
import '../../entities/user/UserData.dart';



class editProfile extends AbstractPage{

  final UserData userData;

  editProfile({
    Key key,
    this.userData
  }) : super(key: key,
      appBarTitle: 'EditProfile',
      appBarColorBg: Colors.blue,
      appBarColorTxt: Colors.white);

  _editProfileState createState() => _editProfileState();

}

class _editProfileState extends PageState<editProfile>{
  bool courseExpand = false;
  bool subjectExpand = false;
  bool teacherExpand = false;

  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController txtController = new TextEditingController();
  String tempName;


  //LISTS THAT WILL CONTAIN ALL COURSES , SUBJECTS & TEACHERS AVAILABLE
  final List<String> semesterList = new List();
  final List<String> subjectList = new List();
  final List<String> teacherList = new List();

  //LIST PASSED AS ARGUEMENT TO BE SEARCHED
  List<String> listToSearch = new List();

  Color c1 = Color.fromRGBO(225, 249, 255, 1);
  Color c2 = Color.fromRGBO(241, 248, 255, 1);

  //SMALL SAMPLE
  _editProfileState(){

    semesterList.add("Semseter Course 1");
    semesterList.add("Semseter Course 2");
    semesterList.add("Semseter Course 3");
    semesterList.add("Semseter Course 4");
    semesterList.add("Semseter Course 5");

    subjectList.add("Programming");
    subjectList.add("Video Games");
    subjectList.add("Music");

    teacherList.add("Professor A");
    teacherList.add("Professor B");
  }

  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
    return Column(
        children: <Widget>[
          EditName(),
          SizedBox(height:20),
          DropDownElement("Semester Courses", 1),
          SizedBox(height:20),
          DropDownElement("Favorite Subjects", 2),
          SizedBox(height:20),
          DropDownElement("Favorite Teachers", 3),
          SizedBox(height:20),
          saveButton(),
        ],
    );
  }

  void _toggleExpand(int view) {
    setState(() {
      if(view == 1){
        courseExpand = !courseExpand;
        subjectExpand = false;
        teacherExpand = false;
      }

      if(view == 2){
        courseExpand = false;
        subjectExpand = !subjectExpand;
        teacherExpand = false;
      }

      if(view == 3){
        courseExpand = false;
        subjectExpand = false;
        teacherExpand = !teacherExpand;
      }
    });
  }

  Column DropDownElement(String title, int ID){

    bool objIsExpanded = true;
    if(ID == 1)
      objIsExpanded = courseExpand;
    if(ID == 2)
      objIsExpanded = subjectExpand;
    if(ID == 3)
      objIsExpanded = teacherExpand;


    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:30, left:30, right:30),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Column(
                children: <Widget>[
                  Header(title, ID)
                ]
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left:30, right: 30),
          child: objIsExpanded ? dropDownView(title, ID) : null,
        )
      ],
    );
  }

  Padding EditName(){

    return Padding(
        padding: EdgeInsets.only(top:30, left: 30, right: 30),
        child: Container(
          height: 50,
          color: c2,
          child: Form(
            key: formKey,
            child: TextFormField(
              initialValue: widget.userData.name,
              textInputAction: TextInputAction.done,
              onSaved: (String val) => tempName = val ,
              validator: (value) { return value.length < 3 ? "Name can't be less than 3 characters!" : null; },
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.edit, color: Colors.blue,),
                contentPadding: EdgeInsets.only(top:20, left:15),
              ),
            ),
          ),
        )
    );

  }

  Row Header(String title, int ID) {

    return Row(
        children:  <Widget>[
          Expanded(
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.left,
                    )
                ),
                onPressed: (){_toggleExpand(ID);}
            ),
          ),
          IconButton(
            highlightColor: c1,
            splashColor: c1,
            color: Colors.blue,
            icon: Icon(Icons.keyboard_arrow_down),
            onPressed: (){_toggleExpand(ID);},
          )
        ]
    );
  }

  Column dropDownView(String title, int ID){

    return Column(
      children: <Widget>[
        ListView(
            shrinkWrap: true,
            children: buildList(ID)
        ),
        if(title !=  "Semester Courses")
          addNewTile(ID)
      ],
    );
  }

  Container addNewTile(int ID){

    List<String> userPrefList;

    if(ID == 1){
      listToSearch = semesterList;
    }
    if(ID == 2){
      listToSearch = subjectList;
      userPrefList = widget.userData.favSubjects;
    }
    if(ID == 3){
      listToSearch = teacherList;
      userPrefList = widget.userData.favTeachers;
    }


    return Container(
        color: Colors.grey[100],
        child: ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            title: Text("Add new", style: TextStyle(color: Colors.black),),
            trailing: IconButton(
              color: Colors.black,
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(
                        builder: (__) => new addFavorite(
                            toSearch: listToSearch,
                            userPref: userPrefList,
                        )
                    )
                );
              },
            )
        )
    );
  }

  Padding saveButton(){

    return Padding(
      padding: EdgeInsets.only(top:30, left: 90, right: 90, bottom: 30),
      child: Container(
        color: Colors.blue,
        child: FlatButton(
            child: SizedBox(
              width: double.infinity,
              child: Text("SAVE CHANGES",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: (){
              if (formKey.currentState.validate()){
                formKey.currentState.save();
                widget.userData.name = tempName;
              }
            }
        ),
      ) ,
    );

  }

  List<objTile> buildList(int ID){
    if(ID == 1)
      return semesterList.map((title) => new objTile(title, onTap: () => deleteItem(semesterList, semesterList, title))).toList();
    if(ID == 2)
      return widget.userData.favSubjects.map((title) => new objTile(title, onTap:() => deleteItem(subjectList, widget.userData.favSubjects, title))).toList();
    else
      return widget.userData.favTeachers.map((title) => new objTile(title, onTap: () => deleteItem(teacherList, widget.userData.favTeachers, title))).toList();
  }

  void deleteItem(List<String> mainList, List<String> favlist, String name){
    setState(() {
      mainList.add(name);
      favlist.remove(name);
    });
  }

}

class objTile extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  Color c2 = Color.fromRGBO(241, 248, 255, 1);

  objTile(this.name, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: c2,
        child: ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            title: new Text(name, style: TextStyle(color: Colors.blue),),
            trailing: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.close),
              onPressed: onTap,
            )
        ));
  }
}
