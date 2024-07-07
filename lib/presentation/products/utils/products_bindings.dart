import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/products/datasource/products_remote_data_source.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/data/products/repository/products_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:get/get.dart';


class ProductsBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => ProductsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => ProductsRepository(
        remoteDataSource: Get.find<ProductsRemoteDataSource>()));
    Get.lazyPut(
            () => ProductsInteractor(repository: Get.find<ProductsRepository>()));
    Get.lazyPut(() =>
        ProductsController(productsInteractor: Get.find<ProductsInteractor>()));
  }


}
