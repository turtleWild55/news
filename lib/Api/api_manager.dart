import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///import 'package:http/http.dart';
import 'package:news_app/Api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceEndpoint,
        {'ApiKey': 'abb112e486cc4e76ab30ddb8d7d5d189', 'category': categoryId});
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=abb112e486cc4e76ab30ddb8d7d5d189
  static Future<NewsResponse?> getNews({
    String? sourceId,
    String? q,
    int? pageNumber,
    int? pageSize,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndpoint, {
      'apiKey': 'abb112e486cc4e76ab30ddb8d7d5d189',
      'sources': sourceId,
      'q': q,
      'page': pageNumber.toString(),
      'pageSize': pageSize.toString(),
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
