import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/categories/interactor/category_interactor.dart';
import 'package:ecommerce_mobile/data/products/interactor/products_interactor.dart';
import 'package:ecommerce_mobile/presentation/home/controller/home_controller.dart';
import 'package:ecommerce_mobile/presentation/notification/notification_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => HomeController(
        productsInteractor: Get.find<ProductsInteractor>(),
        adsInteractor: Get.find<AdsInteractor>(),
        categoryInteractor: Get.find<CategoryInteractor>()));
    Get.lazyPut(()=> NotificationController(userInteractor: Get.find()));
  }
}
