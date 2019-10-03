import 'package:flutter/material.dart';
import '../AbstractPage.dart';
import '../fragments/SearchList.dart';

class addFavorite extends AbstractPage{

  //List that will be searched depending on what user has clicked
  List<String> toSearch;
  //List with current preferences;
  List<String> userPref;

  addFavorite({
    Key key,
    this.toSearch,
    this.userPref,
  }) : super(key: key,
      appBarTitle: 'Add Favorite',
      appBarColorBg: Colors.blue,
      appBarColorTxt: Colors.white);

  addFavoriteState createState() => addFavoriteState();
}

class addFavoriteState extends PageState<addFavorite>{


  final GlobalKey<dynamic> searchKey = new GlobalKey();

  //Final list including user's choices to add. This is returned.
  List<String> toAdd = new List();


  @override
  Widget body(GlobalKey<ScaffoldState> scfKey) {
      return SearchList(
          key: searchKey,
          courselist: widget.toSearch,
          mapTile: (title) => new objTile(title, onTap: () => onAdd(title)),
          onEmpty: showFullList,
      );
  }

  List<objTile> showFullList(){
    return widget.toSearch.map((title) => objTile(title, onTap: () => onAdd(title))).toList();
  }

  void onAdd(String value){
    setState(() {
      widget.userPref.add(value);
      widget.toSearch.remove(value);
    });
  }

}

class objTile extends StatelessWidget{
  final title;
  final VoidCallback onTap;

  objTile(this.title,  {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed:() {
            this.onTap();
          })
    );
  }

}