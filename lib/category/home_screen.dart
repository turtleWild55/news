import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/category/categories_list.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/content_details.dart';
import 'package:news_app/category/search%20_page.dart';
import 'package:news_app/drawer/drawer.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'category_DM.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryDM> categoriesList = CategoryDM.getCategories();
  int newSelected = 0;
  CategoryDM? selectedCategory;
  Article? selectedArticle;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      Container(
        color: Colors.white,
        child: Image.asset(
          'assets/images/img.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
          drawer: Drawer(
            child: HomeDrawer(onDrawerClicked: onDrawerClick),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Search());
                  },
                  icon: Icon(Icons.search))
            ],
            toolbarHeight: MediaQuery.of(context).size.height * 0.09,
            title: Text(
              newSelected == HomeDrawer.settings
                  ? AppLocalizations.of(context)!.settings
                  : selectedCategory == null
                      ? AppLocalizations.of(context)!.news_app
                      : selectedCategory!.text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          body: selectedArticle != null
              ? ContentDetails(/*article: selectedArticle!*/)
              : newSelected == HomeDrawer.settings
                  ? Settings()
                  : selectedCategory == null
                      ? CategoriesList(
                          categoriesList: categoriesList,
                          onCategoryClick: onCategoryClicked,
                        )
                      : CategoryDetails(category: selectedCategory!)),
    ]);
  }

  void onCategoryClicked(CategoryDM userSelected) {
    selectedCategory = userSelected;

    /// newSelected=0;
    setState(() {});
  }

  void onDrawerClick(int selected) {
    newSelected = selected;
    selectedCategory = null;
    selectedArticle = null;
    Navigator.pop(context);
    setState(() {});
  }

  void onArticleClicked(Article article) {
    selectedArticle = article;
    setState(() {});
  }
}

class Search extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Style style = Style();
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query == '' ? close(context, '') : query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchPage(q: query == '' ? 't' : query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ///List<String>suggestions=words.where((element) =>element.startsWith(query)).toList();
    return Container();
  }
}

class Style extends MaterialStateTextStyle {
  @override
  TextStyle resolve(Set<MaterialState> states) {
    return TextStyle(color: Colors.white);
  }
}

/* ListView.builder(itemBuilder:
    (context,index)=>InkWell(onTap: (){

      showResults(context);
    },
      child: Container(padding: EdgeInsets.all(10),
          child:query.isEmpty?Text(words[index]):Text(suggestions[index])),
    ),
itemCount: query==''?words.length:suggestions.length,);*/
