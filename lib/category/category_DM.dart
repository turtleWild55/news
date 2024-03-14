import 'dart:ui';

import 'package:news_app/Themes.dart';

import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class CategoryDM {
  String id;
  String text;
  String imagePath;
  Color color;

  CategoryDM(
      {required this.id,
      required this.text,
      required this.color,
      required this.imagePath});

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          id: 'sports',
          text: 'sports',
          color: Themes.red,
          imagePath: 'assets/images/ball.png'),
      CategoryDM(
          id: 'business',
          text: 'Business',
          color: Themes.brown,
          imagePath: 'assets/images/bussines.png'),
      CategoryDM(
          id: 'health',
          text: 'Health',
          color: Themes.pink,
          imagePath: 'assets/images/health.png'),
      CategoryDM(
          id: 'science',
          text: 'Science',
          color: Themes.green,
          imagePath: 'assets/images/science.png'),
      CategoryDM(
          id: 'general',
          text: 'General',
          color: Themes.darkBlue,
          imagePath: 'assets/images/Politics.png'),
      CategoryDM(
          id: 'entertainment',
          text: 'Entertainment',
          color: Themes.babyBlue,
          imagePath: 'assets/images/environment.png'),
      CategoryDM(
          id: 'technology',
          text: 'Technology',
          color: Themes.yellow,
          imagePath: 'assets/images/science.png'),
    ];
  }
}
