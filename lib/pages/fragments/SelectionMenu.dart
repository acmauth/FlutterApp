import 'package:flutter/material.dart';

import 'ExpandableSection.dart';
import 'SearchBar.dart';
import 'TappableElement.dart';

class SelectionMenu extends StatefulWidget {
  SelectionMenu({
    Key key,
    @required this.sectionTitle,
    @required this.sectionIcon,
    @required this.fullIcon,
    @required this.emptyIcon,
    @required this.selection,
    @required this.options,
  }) : super(key: key);

  final String sectionTitle;
  final IconData sectionIcon;
  final IconData fullIcon;
  final IconData emptyIcon;
  final Set<String> selection;
  final Set<String> options;

  @override
  _SelectionMenuState createState() => _SelectionMenuState();
}

class _SelectionMenuState extends State<SelectionMenu> {
  @override
  Widget build(BuildContext context) {
    return ExpandableSection(
      title: widget.sectionTitle,
      barColor: Theme.of(context).appBarTheme.color.withOpacity(0.1),
      extras: Icon(widget.sectionIcon),
      fillContentBg: false,
      padding: null,
      content: Column(
        children: <Widget>[
          Container(
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              children: widget.selection
                  .map(
                    (str) => TappableElement(
                      label: str,
                      icon: widget.fullIcon,
                      flexi: true,
                      onTap: () {
                        setState(() {
                          widget.options.add(str);
                          widget.selection.remove(str);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          SearchBar(
            searchSet: widget.options,
            suggestions: widget.options.toList(),
            tileIcon: widget.emptyIcon,
            onTap: (item) {
              setState(() {
                widget.options.remove(item);
                widget.selection.add(item);
              });
            },
          ),
        ],
      ),
    );
  }
}
