import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';

import '../repository/settings_repository.dart';

class SettingsInteractor {
  final SettingsRepositoryImpl repository;

  SettingsInteractor({required this.repository});

  void saveThemeType(bool isLightTheme) {
    repository.saveThemeType(isLightTheme);
  }

  bool isThemeLight() {
    return repository.isThemeLight();
  }

  void saveLanguage(String languageCode) {
    repository.saveLanguage(languageCode);
  }

  String getLanguage() {
    return repository.getLanguage();
  }

  Future<SettingModel> getAppSettings() async {
    return repository.getAppSettings();
  }
}
