import 'package:flutter/material.dart';
import 'package:news_app/category/News_widget.dart';
import 'package:news_app/category/tab_item.dart';

import '../model/SourceResponse.dart';

class Tabs extends StatefulWidget {
  List<Source> sources = [];

  Tabs({required this.sources});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((source) => TabItem(
                          isSelected:
                              selectedIndex == widget.sources.indexOf(source)
                                  ? true
                                  : false,
                          source: source,
                        ))
                    .toList()),
            News(source: widget.sources[selectedIndex])
          ],
        ));
  }
}
