import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../Api/api_manager.dart';
import 'article_item.dart';
import 'content_details.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'searchpage';
  String q;

  SearchPage({required this.q});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder(
        future: ApiManager.getNews(q: widget.q),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ContentDetails.routeName,
                        arguments: newsList[index]);
                  },
                  child: ArticleItem(article: newsList[index]));
            },
            itemCount: newsList.length,
          );
        });
  }
}
