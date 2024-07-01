import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  final SharedPreferences prefs;

  SettingsLocalDataSource({required sharedPreferences})
      : prefs = sharedPreferences;

  static const String themeType = "themeType";
  static const String languageCode = "languageCode";

  bool isThemeLight() {
    return prefs.getBool(themeType) ?? true;
  }

  void saveThemeType(bool isLightTheme) {
    prefs.setBool(themeType, isLightTheme);
  }

  void saveLanguage(String code) {
    prefs.setString(languageCode, code);
  }

  String getLanguage() {
    return prefs.getString(languageCode) ?? "en";
  }
}
