import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/app_texts.dart';

class ThemeProvider extends ChangeNotifier {
  bool switchValue = false;

  changeSwitchValue(bool value) async {
    var box = Hive.box(AppTexts.settingsBox);
    await box.put(AppTexts.switchValue, value);
    switchValue = box.get(AppTexts.switchValue);

    notifyListeners();
  }

  setSwitchValueFromHive() {
    var box = Hive.box(AppTexts.settingsBox);
    switchValue = box.get(AppTexts.switchValue) ?? false;
    notifyListeners();
  }
}
