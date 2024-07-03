import 'package:ecommerce_mobile/data/appsettings/datasource/remote/end_points/settings_endpoints.dart';
import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';

import '../../../base/network/service_generator.dart';

class SettingsRemoteDataSource {
  final ServiceGenerator service;
  final AuthManager authManager;

  SettingsRemoteDataSource({required this.service, required this.authManager});

  Future<SettingModel> getAppSettings() async {
    final userToken = authManager.getToken();
    return service
        .call(SettingsEndPoints.getAppSettings(userToken: userToken))
        .then((response) {
      return SettingModel.fromJson(response);
    });
  }
}
