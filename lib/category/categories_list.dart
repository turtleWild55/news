import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'category_DM.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  List<CategoryDM> categoriesList = [];
  Function onCategoryClick;

  CategoriesList({required this.categoriesList, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              AppLocalizations.of(context)!.select_category,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.of(context).size.height * 0.01,
                  mainAxisSpacing: MediaQuery.of(context).size.width * 0.02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClick(categoriesList[index]);
                },
                child: CategoryItem(
                  index: index,
                  category: categoriesList[index],
                ),
              ),
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
