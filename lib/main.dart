import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';
import 'package:news_app/category/article_item.dart';
import 'package:news_app/category/content_details.dart';
import 'package:news_app/category/home_screen.dart';
import 'package:news_app/category/search%20_page.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'category/category_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

//59d33133ea6d6121632edb10332c204d
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ContentDetails.routeName: (context) => ContentDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.lang),
      theme: Themes.lightTheme,
    );
  }
}
