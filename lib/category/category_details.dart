import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/category/Tabs.dart';
import 'package:news_app/category/category_DM.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';
  CategoryDM category;

  ///Function onArticleClick;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Network problem'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                        setState(() {});
                      },
                      child: Text('Try Again'))
                ],
              );
            }
          }
          if (snapshot.data?.status == 'error') {
            return Column(children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  child: Text('Try Again'),
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  })
            ]);
          }

          var sources = snapshot.data!.sources!;
          return Tabs(sources: sources);
        });
  }
}
