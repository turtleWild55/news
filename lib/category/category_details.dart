import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/api_manager.dart';
import 'package:news_app/category/Tabs.dart';

import '../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'CategoryDetails';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
          appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.09,
              title: Text(
                'Sports',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              )),
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(),
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
                              ApiManager.getSources();
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
                          ApiManager.getSources();
                          setState(() {});
                        })
                  ]);
                }

                var sources = snapshot.data!.sources!;
                return Tabs(sources: sources);
              }),
        )
      ],
    );
  }
}
