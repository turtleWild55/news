import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';

import '../model/SourceResponse.dart';

class TabItem extends StatefulWidget {
  Source source;
  bool isSelected;

  TabItem({required this.isSelected, required this.source});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: widget.isSelected ? Themes.green : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Themes.green)),
        child: Text(
          widget.source.name ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: widget.isSelected ? Colors.white : Themes.green),
        ));
  }
}
