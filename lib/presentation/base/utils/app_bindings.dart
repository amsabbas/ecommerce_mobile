import 'package:ecommerce_mobile/data/ads/datasource/ads_remote_data_source.dart';
import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/ads/repository/ads_repository_impl.dart';
import 'package:ecommerce_mobile/data/appsettings/datasource/local/settings_local_data_source.dart';
import 'package:ecommerce_mobile/data/appsettings/interactor/settings_interactor.dart';
import 'package:ecommerce_mobile/data/appsettings/repository/settings_repository.dart';
import 'package:ecommerce_mobile/data/areas/datasource/areas_remote_data_source.dart';
import 'package:ecommerce_mobile/data/areas/interactor/area_interactor.dart';
import 'package:ecommerce_mobile/data/areas/repository/areas_repository_impl.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/categories/datasource/categories_remote_data_source.dart';
import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/categories/repository/categories_repository_impl.dart';
import 'package:ecommerce_mobile/data/products/datasource/products_remote_data_source.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/data/products/repository/products_repository_impl.dart';

import 'package:ecommerce_mobile/data/user/datasource/user_remote_data_source.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/data/user/repository/user_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/ads/controller/ads_controller.dart';
import 'package:ecommerce_mobile/presentation/areas/controller/areas_controller.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/categories/controller/categories_controller.dart';
import 'package:ecommerce_mobile/presentation/login/controller/login_controller.dart';
import 'package:ecommerce_mobile/presentation/orders/controller/orders_controller.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/app_settings_controller.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await _addGeneralDependencies();
    await _addAdsDependencies();
    await _addAreasDependencies();
    await _addCategoriesDependencies();
    await _addProductsDependencies();
    await _addOrdersDependencies();
  }

  Future<void> _addGeneralDependencies() async {
    await Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);
    Get.lazyPut(
        () => AuthManager(sharedPreferences: Get.find<SharedPreferences>()));

    Get.lazyPut(() => SettingsLocalDataSource(
        sharedPreferences: Get.find<SharedPreferences>()));
    Get.lazyPut(() => SettingsRepositoryImpl(
        localDataSource: Get.find<SettingsLocalDataSource>()));
    Get.lazyPut(() =>
        SettingsInteractor(repository: Get.find<SettingsRepositoryImpl>()));
    Get.lazyPut(() => AppSettingsController(
        settingsInteractor: Get.find<SettingsInteractor>()));

    Get.lazyPut(() => ServiceGenerator("http://localhost:3000/",
        Get.find<AuthManager>(), Get.find<SettingsLocalDataSource>()));

    Get.lazyPut(() => UserRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => UserRepository(
        authManager: Get.find<AuthManager>(),
        remoteDataSource: Get.find<UserRemoteDataSource>()));
    Get.lazyPut(() => UserInteractor(repository: Get.find<UserRepository>()));

    Get.lazyPut(
      () => UserController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(
      () => LoginController(userInteractor: Get.find<UserInteractor>()),
    );
  }



  Future<void> _addAdsDependencies() async {
    Get.lazyPut(() => AdsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(
        () => AdsRepository(remoteDataSource: Get.find<AdsRemoteDataSource>()));
    Get.lazyPut(() => AdsInteractor(repository: Get.find<AdsRepository>()));
    Get.lazyPut(() => AdsController(
        adsInteractor: Get.find<AdsInteractor>()));
  }

  Future<void> _addAreasDependencies() async {
    Get.lazyPut(() => AreasRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() =>
        AreasRepository(remoteDataSource: Get.find<AreasRemoteDataSource>()));
    Get.lazyPut(() => AreaInteractor(repository: Get.find<AreasRepository>()));
    Get.lazyPut(
        () => AreasController(areaInteractor: Get.find<AreaInteractor>()));
  }

  Future<void> _addCategoriesDependencies() async {
    Get.lazyPut(() => CategoriesRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => CategoriesRepository(
        remoteDataSource: Get.find<CategoriesRemoteDataSource>()));
    Get.lazyPut(
        () => CategoryInteractor(repository: Get.find<CategoriesRepository>()));
    Get.lazyPut(() => CategoriesController(
        categoriesInteractor: Get.find<CategoryInteractor>()));
  }

  Future<void> _addProductsDependencies() async {
    Get.lazyPut(() => ProductsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => ProductsRepository(
        remoteDataSource: Get.find<ProductsRemoteDataSource>()));
    Get.lazyPut(
        () => ProductsInteractor(repository: Get.find<ProductsRepository>()));
    Get.lazyPut(
      () => ProductsController(
          categoryInteractor: Get.find<CategoryInteractor>(),
          productsInteractor: Get.find<ProductsInteractor>()),
    );
  }

  Future<void> _addOrdersDependencies() async {

  }


}