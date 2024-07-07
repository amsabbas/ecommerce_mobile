import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/cart/datasource/cart_remote_data_source.dart';
import 'package:ecommerce_mobile/data/cart/interactor/cart_interactor.dart';
import 'package:ecommerce_mobile/data/cart/repository/cart_repository_impl.dart';
import 'package:ecommerce_mobile/data/checkout/interactor/checkout_interactor.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/presentation/cart/controller/cart_controller.dart';
import 'package:ecommerce_mobile/presentation/cart/controller/cart_item_controller.dart';
import 'package:ecommerce_mobile/presentation/checkout/utils/checkout_bindings.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await CheckoutBindings().dependencies();
    Get.lazyPut(() => CartRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() =>
        CartRepository(remoteDataSource: Get.find<CartRemoteDataSource>()));
    Get.lazyPut(() => CartInteractor(repository: Get.find<CartRepository>()));
    Get.put(CartController(
        cartInteractor: Get.find<CartInteractor>(),
        checkOutInteractor: Get.find<CheckoutInteractor>()));
    Get.put(CartItemController(
      productsInteractor: Get.find<ProductsInteractor>(),
    ));
  }

}
