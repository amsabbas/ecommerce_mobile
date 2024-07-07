import 'package:ecommerce_mobile/data/appsettings/datasource/local/settings_local_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/datasource/remote/settings_remote_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/interactor/settings_interactor.dart';
import 'package:ecommerce_mobile/data/appsettings/repository/settings_repository.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/cart/utils/cart_bindings.dart';
import 'package:ecommerce_mobile/presentation/home/utils/ads_bindings.dart';
import 'package:ecommerce_mobile/presentation/home/utils/home_bindings.dart';
import 'package:ecommerce_mobile/presentation/orders/base/utils/orders_bindings.dart';
import 'package:ecommerce_mobile/presentation/products/utils/categories_bindings.dart';
import 'package:ecommerce_mobile/presentation/products/utils/products_bindings.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/app_settings_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await addGeneralDependencies();
    await UserBindings().dependencies();
    await AdsBindings().dependencies();
    await CategoriesBindings().dependencies();
    await ProductsBindings().dependencies();
    await CartBindings().dependencies();
    await HomeBindings().dependencies();
    await OrdersBindings().dependencies();
  }

  Future<void> addGeneralDependencies() async {
    await Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);
    Get.lazyPut(
        () => AuthManager(sharedPreferences: Get.find<SharedPreferences>()));

    Get.lazyPut(() => SettingsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => SettingsLocalDataSource(
        sharedPreferences: Get.find<SharedPreferences>()));
    Get.lazyPut(() => SettingsRepositoryImpl(
        localDataSource: Get.find<SettingsLocalDataSource>(),
        remoteDataSource: Get.find<SettingsRemoteDataSource>()));
    Get.lazyPut(() =>
        SettingsInteractor(repository: Get.find<SettingsRepositoryImpl>()));
    Get.lazyPut(() => AppSettingsController(
        settingsInteractor: Get.find<SettingsInteractor>()));

    Get.lazyPut(() => ServiceGenerator(
        baseURL, Get.find<AuthManager>(), Get.find<SettingsLocalDataSource>()));
  }
}
