import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleItem extends StatelessWidget {
  static const String routeName = 'articleItem';
  Article article;

  ArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.fill,
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            article.author ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 3,
          ),
          Text(article.title ?? '',
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 3,
          ),
          Text(article.publishedAt ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
