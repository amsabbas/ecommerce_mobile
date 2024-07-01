import '../datasource/local/settings_local_data_source.dart';

class SettingsRepositoryImpl {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl(
      {required this.localDataSource});

  void saveThemeType(bool isLightTheme) {
    localDataSource.saveThemeType(isLightTheme);
  }

  bool isThemeLight() {
    return localDataSource.isThemeLight();
  }

  void saveLanguage(String languageCode) {
    localDataSource.saveLanguage(languageCode);
  }

  String getLanguage() {
    return localDataSource.getLanguage();
  }



}
