import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/search/exports.dart';
import 'IconLabelPair.dart';

const String DEFAULT_LABEL = "Your history will show up here.";

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
    @required this.searchSet,
    @required this.onTap,
    this.tileIcon = Icons.description,
    this.suggestions,
  }) : super(key: key);

  final Set<String> searchSet;
  final dynamic onTap;
  final IconData tileIcon;
  final List<String> suggestions;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  final results = Set<SearchTile>();
  bool showHist = true;

  @override
  Widget build(BuildContext context) {
    _listen();

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            _buildBar(),
            showHist ? _buildHistory() : _buildResults(),
          ],
        );
      },
    );
  }

  SearchTile getTile(String str, {bool isHist = false}) {
    return SearchTile(
      label: str,
      tileIcon: widget.tileIcon,
      isHist: isHist,
      onTap: () => widget.onTap(str),
    );
  }

  void _populate(Set<String> match, Function(String) predicate) {
    Set<String> _filtered = widget.searchSet.toSet();
    _filtered.retainWhere(predicate);
    _filtered.forEach((r) => match.add(r));
  }

  void _populateGoodMatch(Set<String> match, String input) {
    _populate(
      match,
      (e) => e.split(" ").any((w) => w.toLowerCase().startsWith(input)),
    );
  }

  void _populatePartialMatch(Set<String> match, String input) {
    _populate(
      match,
      (e) => e.toLowerCase().contains(input),
    );
  }

  void _listen() {
    controller.addListener(() {
      String input = controller.text.trim().toLowerCase();
      if (input.isNotEmpty) {
        results.clear();
        Set<String> match = Set<String>();
        _populateGoodMatch(match, input);
        _populatePartialMatch(match, input);
        match.forEach((str) => results.add(getTile(str)));
      }

      setState(() {
        showHist = input.isEmpty;
      });
    });
  }

  Widget _buildBar() {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.srcOver,
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).accentColor.withOpacity(0.05),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          hintText: 'Search',
          icon: Icon(Icons.search),
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildResults() {
    return Column(children: results.toList());
  }

  Widget _buildHistory() {
    if (widget.suggestions != null) {
      return Column(
        children: widget.suggestions.map((str) => getTile(str)).toList(),
      );
    }
    final history = BlocProvider.of<SearchBloc>(context).state.history;
    if (history.isEmpty) {
      return SearchTile(
        label: DEFAULT_LABEL,
        tileIcon: widget.tileIcon,
        isHist: true,
        onTap: null,
      );
    }
    return Column(
      children: history
          .map((str) => getTile(str, isHist: true))
          .toList()
          .reversed
          .toList(),
    );
  }
}

class SearchTile extends StatelessWidget {
  SearchTile({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.tileIcon,
    this.isHist = false,
  }) : super(key: key);

  final String label;
  final dynamic onTap;
  final IconData tileIcon;
  final bool isHist;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconLabelPair(
                icon: isHist ? Icons.history : tileIcon,
                label: label,
              ),
            ),
            if (isHist && label != DEFAULT_LABEL)
              GestureDetector(
                onTap: () {
                  BlocProvider.of<SearchBloc>(context)
                      .add(HistoryDeleteEvent(label));
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.close),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
