import 'package:ecommerce_mobile/data/ads/datasource/ads_remote_data_source.dart';
import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/ads/repository/ads_repository_impl.dart';
import 'package:ecommerce_mobile/data/appsettings/datasource/local/settings_local_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/datasource/remote/settings_remote_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/interactor/settings_interactor.dart';
import 'package:ecommerce_mobile/data/appsettings/repository/settings_repository.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/categories/datasource/categories_remote_data_source.dart';
import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/categories/repository/categories_repository_impl.dart';
import 'package:ecommerce_mobile/data/products/datasource/products_remote_data_source.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/data/products/repository/products_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:ecommerce_mobile/presentation/orders/base/utils/orders_bindings.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/app_settings_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await addGeneralDependencies();
    await UserBindings().dependencies();
    await _addAdsDependencies();
    await _addCategoriesDependencies();
    await _addProductsDependencies();
    await _addHomeDependencies();
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

    Get.lazyPut(() => ServiceGenerator("http://192.168.1.106:3000/",
        Get.find<AuthManager>(), Get.find<SettingsLocalDataSource>()));
  }

  Future<void> _addAdsDependencies() async {
    Get.lazyPut(() => AdsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(
        () => AdsRepository(remoteDataSource: Get.find<AdsRemoteDataSource>()));
    Get.lazyPut(() => AdsInteractor(repository: Get.find<AdsRepository>()));
  }

  Future<void> _addHomeDependencies() async {
    Get.lazyPut(() => HomeController(
        productsInteractor: Get.find<ProductsInteractor>(),
        adsInteractor: Get.find<AdsInteractor>(),
        categoryInteractor: Get.find<CategoryInteractor>()));
  }

  Future<void> _addCategoriesDependencies() async {
    Get.lazyPut(() => CategoriesRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => CategoriesRepository(
        remoteDataSource: Get.find<CategoriesRemoteDataSource>()));
    Get.lazyPut(
        () => CategoryInteractor(repository: Get.find<CategoriesRepository>()));
  }

  Future<void> _addProductsDependencies() async {
    Get.lazyPut(() => ProductsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => ProductsRepository(
        remoteDataSource: Get.find<ProductsRemoteDataSource>()));
    Get.lazyPut(
        () => ProductsInteractor(repository: Get.find<ProductsRepository>()));
    Get.lazyPut(() => ProductsController());
  }
}
