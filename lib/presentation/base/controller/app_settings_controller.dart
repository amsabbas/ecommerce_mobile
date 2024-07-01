
import 'package:get/get.dart';

import '../../../data/appsettings/interactor/settings_interactor.dart';

class AppSettingsController extends GetxController {


  final SettingsInteractor settingsInteractor;

  AppSettingsController({required this.settingsInteractor});

  bool isThemeLight() {
    return settingsInteractor.isThemeLight();
  }

  void saveLanguage(String lang) {
    settingsInteractor.saveLanguage(lang);
  }

  String getLanguage() {
    return settingsInteractor.getLanguage();
  }


}
