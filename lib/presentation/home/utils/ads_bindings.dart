import 'package:ecommerce_mobile/data/ads/datasource/ads_remote_data_source.dart';
import 'package:ecommerce_mobile/data/ads/interactor/ads_interactor.dart';
import 'package:ecommerce_mobile/data/ads/repository/ads_repository_impl.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:get/get.dart';

class AdsBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => AdsRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(
            () => AdsRepository(remoteDataSource: Get.find<AdsRemoteDataSource>()));
    Get.lazyPut(() => AdsInteractor(repository: Get.find<AdsRepository>()));
  }
}
