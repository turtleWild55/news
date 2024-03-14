import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onDrawerClicked;

  HomeDrawer({required this.onDrawerClicked});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.20,
          color: Themes.green,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            onDrawerClicked(categories);
          },
          child: Row(children: [
            Icon(Icons.list),
            SizedBox(
              width: 9,
            ),
            Text(AppLocalizations.of(context)!.categories,
                style: Theme.of(context).textTheme.titleLarge)
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            onDrawerClicked(settings);
          },
          child: Row(
            children: [
              Icon(Icons.settings),
              SizedBox(
                width: 9,
              ),
              Text(
                AppLocalizations.of(context)!.settings,
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
