import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/orders/datasource/orders_remote_data_source.dart';
import 'package:ecommerce_mobile/data/orders/interactor/order_interactor.dart';
import 'package:ecommerce_mobile/data/orders/respository/orders_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/orders/base/controller/orders_controller.dart';
import 'package:get/get.dart';

class OrdersBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => OrdersRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() =>
        OrdersRepository(remoteDataSource: Get.find<OrdersRemoteDataSource>()));
    Get.lazyPut(
        () => OrderInteractor(repository: Get.find<OrdersRepository>()));
    Get.lazyPut(
        () => OrdersController(interactor: Get.find<OrderInteractor>()));
  }
}
