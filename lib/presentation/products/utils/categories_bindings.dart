import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/categories/datasource/categories_remote_data_source.dart';
import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/categories/repository/categories_repository_impl.dart';
import 'package:get/get.dart';

class CategoriesBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => CategoriesRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => CategoriesRepository(
        remoteDataSource: Get.find<CategoriesRemoteDataSource>()));
    Get.lazyPut(
        () => CategoryInteractor(repository: Get.find<CategoriesRepository>()));
  }
}
