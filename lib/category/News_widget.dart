import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';

import '../model/SourceResponse.dart';

class News extends StatefulWidget {
  Source source;

  News({required this.source});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(widget.source.id ?? ''),
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
              return Text(newsList[index].title ?? '');
            },
            itemCount: newsList.length,
          );
        });
  }
}
