import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../LocalKeyValuePersistence.dart';
import '../../bloc/search/exports.dart';
import 'IconLabelPair.dart';
import 'LoadingIndicator.dart';

const String DEFAULT_LABEL = "Your history will show up here.";

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
    @required this.searchSet,
    @required this.onTap,
    this.tileIcon = Icons.description,
    this.suggestions,
    this.historySize = 5,
  }) : super(key: key);

  final Set<String> searchSet;
  final dynamic onTap;
  final IconData tileIcon;
  final List<String> suggestions;
  final int historySize;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  final results = Set<SearchTile>();
  Future<List<String>> history;
  bool showHist = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

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
      input = _normalizeGreek(input);

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

  String _normalizeGreek(String text){
    text = text.replaceAll(new RegExp("Ά|Α|ά"), 'α')
        .replaceAll(new RegExp("Έ|Ε|έ"), 'ε')
        .replaceAll(new RegExp("Ή|Η|ή"), 'η')
        .replaceAll(new RegExp("Ί|Ϊ|Ι|ί|ΐ|ϊ"), 'ι')
        .replaceAll(new RegExp("Ό|Ο|ό"), 'ο')
        .replaceAll(new RegExp("Ύ|Ϋ|Υ|ύ|ΰ|ϋ"), 'υ')
        .replaceAll(new RegExp("Ώ|Ω|ώ"), 'ω')
        .replaceAll(new RegExp("Σ|ς"), 'σ');
    return text;
  }

  void _loadHistory() {
    Future<List<dynamic>> lHistory =
        LocalKeyValuePersistence.getSearchHistory();
    setState(() {
      history = lHistory;
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
          hintText: 'Search by course name',
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
        children: widget.suggestions
            .sublist(0, widget.historySize)
            .map((str) => getTile(str))
            .toList(),
      );
    }
    return FutureBuilder(
      future: history,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          BlocProvider.of<SearchBloc>(context).state.history = snapshot.data;
          final history = BlocProvider.of<SearchBloc>(context).state.history;
          if (history.isEmpty) {
            return SearchTile(
              label: DEFAULT_LABEL,
              tileIcon: widget.tileIcon,
              isHist: true,
              onTap: null,
            );
          } else {
            return Column(
              children: history
                  .map((str) => getTile(str, isHist: true))
                  .toList()
                  .reversed
                  .toList(),
            );
          }
        } else if (snapshot.hasError) {
          // This is not tested

        } else {
          return LoadingIndicator();
        }
        return SearchTile(
          label: DEFAULT_LABEL,
          tileIcon: widget.tileIcon,
          isHist: true,
          onTap: null,
        );
      },
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
      child: Row(
        children: <Widget>[
          Flexible(
            child: IconLabelPair(
              icon: isHist ? Icons.history : tileIcon,
              label: label,
              flexi: true,
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
    );
  }
}
