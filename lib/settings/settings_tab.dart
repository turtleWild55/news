import 'package:flutter/material.dart';
import 'package:news_app/Themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../Themes.dart';
import '../Themes.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              bottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration:
                  BoxDecoration(border: Border.all(color: Themes.green)),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          provider.lang == 'ar'
                              ? AppLocalizations.of(context)!.arabic
                              : AppLocalizations.of(context)!.english,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Themes.green,
                                  fontWeight: FontWeight.bold))),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Themes.green,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                color: Themes.green,
                width: MediaQuery.of(context).size.width * 0.01)),
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                      onTap: () {
                        provider.changeLang('en');
                      },
                      child: Text(
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: provider.lang == 'ar'
                                      ? Colors.black
                                      : Themes.green),
                          AppLocalizations.of(context)!.english)),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        provider.changeLang('ar');
                      },
                      child: Text(
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: provider.lang == 'en'
                                      ? Colors.black
                                      : Themes.green),
                          AppLocalizations.of(context)!.arabic))
                ],
              ),
            ));
  }
}
