import 'package:flutter/material.dart';

class Themes {
  static Color green = Color(0xff39A552);
  static Color darkBlue = Color(0xff003E90);
  static Color babyBlue = Color(0xff4882CF);
  static Color red = Color(0xffC91C22);
  static Color brown = Color(0xffCF7E48);
  static Color yellow = Color(0xffF2D352);
  static Color pink = Color(0xffED1E79);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ))),
      textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w400, fontSize: 22)));
}
//abb112e486cc4e76ab30ddb8d7d5d189
//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
