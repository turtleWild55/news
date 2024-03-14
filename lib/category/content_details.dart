import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentDetails extends StatelessWidget {
  static const String routeName = 'contentDetails';

  ///Article article;
  ///ContentDetails({required this.article});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    final websiteUri = Uri.parse(article.url ?? '');
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.09,
            title: Text(
              'Sports',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.30,
                  fit: BoxFit.fill,
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              )),
              Text(
                article.source?.name ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(article.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(article.publishedAt ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(article.content ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  launchUrl(websiteUri, mode: LaunchMode.externalApplication);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w700)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_circle_right_sharp)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
