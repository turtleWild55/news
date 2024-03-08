import 'dart:convert';

import 'package:http/http.dart' as http;

///import 'package:http/http.dart';
import 'package:news_app/Api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceEndpoint,
        {'ApiKey': 'abb112e486cc4e76ab30ddb8d7d5d189'});
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=abb112e486cc4e76ab30ddb8d7d5d189
  static Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndpoint,
        {'ApiKey': 'abb112e486cc4e76ab30ddb8d7d5d189', 'source': sourceId});

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
