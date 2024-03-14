import 'package:flutter/foundation.dart';

import '../model/NewsResponse.dart';

class AppConfigProvider extends ChangeNotifier {
  String lang = 'en';

  void changeLang(String newLang) {
    lang = newLang;
    notifyListeners();
  }
}
