import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category/category_DM.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              bottomRight:
                  index % 2 == 0 ? Radius.circular(0) : Radius.circular(20),
              bottomLeft:
                  index % 2 == 0 ? Radius.circular(20) : Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          Image.asset(
              height: MediaQuery.of(context).size.height * 0.09,
              category.imagePath),
          Text(
            index == 0
                ? AppLocalizations.of(context)!.sports
                : index == 1
                    ? AppLocalizations.of(context)!.business
                    : index == 2
                        ? AppLocalizations.of(context)!.health
                        : index == 3
                            ? AppLocalizations.of(context)!.science
                            : index == 4
                                ? AppLocalizations.of(context)!.general
                                : index == 5
                                    ? AppLocalizations.of(context)!
                                        .entertainment
                                    : AppLocalizations.of(context)!.technology,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
