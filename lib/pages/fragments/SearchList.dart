import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchList extends StatefulWidget {
  SearchList({
    Key key,
    this.courselist,
    this.onEmpty,
    this.mapTile,
  }) : super(key: key);

  dynamic mapTile;
  dynamic onEmpty;
  List<String> courselist;
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchList> {
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  bool _IsSearching;
  String _searchText = "";

  final TextEditingController _searchQuery = TextEditingController();

  _SearchState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          this.actionIcon = new Icon(
            Icons.close,
            color: Colors.white,
          );
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
  }

  List<Widget> _buildSearchList() {
    if (_searchText.isEmpty) {
      return widget.onEmpty();
    } else {
      List<Widget> _searchList = List();
      for (int i = 0; i < widget.courselist.length; i++) {
        String name = widget.courselist.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(widget.mapTile(name));
        }
      }
      return _searchList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 50,
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchQuery,
          style: new TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: new InputDecoration(
              border: InputBorder.none,
              suffixIcon: new Icon(
                Icons.search,
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200], width: 2.0),
                  borderRadius: BorderRadius.circular(50)),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.only(left: 15, top: 7),
              hintText: "Search...",
              hintStyle: new TextStyle(
                  color: Colors.black.withOpacity(0.4), fontSize: 18)),
        ),
      ),
      ListView(
        shrinkWrap: true,
        children: _buildSearchList(), // use it
      )
    ]);
  }
}
