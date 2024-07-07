import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/checkout/datasource/checkout_remote_data_source.dart';
import 'package:ecommerce_mobile/data/checkout/interactor/checkout_interactor.dart';
import 'package:ecommerce_mobile/data/checkout/repository/checkout_repository_impl.dart';
import 'package:ecommerce_mobile/data/orders/interactor/order_interactor.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/checkout/controller/checkout_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:get/get.dart';

class CheckoutBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await UserBindings().dependencies();
    Get.lazyPut(() => CheckoutRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => CheckoutRepository(
        remoteDataSource: Get.find<CheckoutRemoteDataSource>()));
    Get.lazyPut(
        () => CheckoutInteractor(repository: Get.find<CheckoutRepository>()));
    Get.put(CheckoutController(
        orderInteractor: Get.find<OrderInteractor>(),
        checkOutInteractor: Get.find<CheckoutInteractor>(),
        userInteractor: Get.find<UserInteractor>()));
  }
}
