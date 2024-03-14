import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/category/article_item.dart';
import 'package:news_app/category/content_details.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../model/SourceResponse.dart';

class News extends StatefulWidget {
  Source source;
  int pageNumber = 1;
  int pagesize = 50;

  ///Function onArticleClick;
  News({required this.source});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  ScrollController _scrollController = ScrollController();

  void initState() {
    _scrollController.addListener(() {
      loadPage();
    });
    super.initState();
  }

  void loadPage() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        widget.pageNumber++;
        ApiManager.getNews(pageNumber: widget.pageNumber);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder(
        future: ApiManager.getNews(
            sourceId: widget.source.id ?? '',
            pageNumber: widget.pageNumber,
            pageSize: widget.pagesize),
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
                      ApiManager.getNews(sourceId: widget.source.id ?? '');
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
              controller: _scrollController,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ContentDetails.routeName,
                          arguments: newsList[index]);

                      ///  widget.onArticleClick(newsList[index]);
                    },
                    child: ArticleItem(article: newsList[index]));
              },
              itemCount: newsList.length);
        });
  }
}
