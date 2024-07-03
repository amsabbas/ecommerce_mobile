
import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

import '../../../data/appsettings/interactor/settings_interactor.dart';

class AppSettingsController extends GetxController {

  final settingsState = ResultState<SettingModel>();

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

  void getSettings() async {
    try {
      settingsState.setLoading();
      settingsState.setSuccess(await settingsInteractor.getAppSettings());
    } catch (error) {
      settingsState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    settingsState.close();
  }

}
