import 'package:ecommerce_mobile/data/appsettings/datasource/remote/settings_remote_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';

import '../datasource/local/settings_local_data_source.dart';

class SettingsRepositoryImpl {
  final SettingsLocalDataSource localDataSource;
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

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

  Future<SettingModel> getAppSettings() async {
    return remoteDataSource.getAppSettings();
  }
}
