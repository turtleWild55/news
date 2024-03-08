import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';

import 'category/category_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: CategoryDetails.routeName,
      routes: {CategoryDetails.routeName: (context) => CategoryDetails()},
      theme: Themes.lightTheme,
    );
  }
}
