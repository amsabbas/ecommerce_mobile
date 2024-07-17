import 'package:ecommerce_mobile/data/areas/datasource/areas_remote_data_source.dart';
import 'package:ecommerce_mobile/data/areas/interactor/area_interactor.dart';
import 'package:ecommerce_mobile/data/areas/repository/areas_repository_impl.dart';
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/user_remote_data_source.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/data/user/repository/user_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/forgot/controller/forgot_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/login/controller/login_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/controller/profile_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/register/controller/register_controller.dart';
import 'package:get/get.dart';

class UserBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => UserRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() => UserRepository(
        authManager: Get.find<AuthManager>(),
        remoteDataSource: Get.find<UserRemoteDataSource>()));
    Get.lazyPut(() => UserInteractor(repository: Get.find<UserRepository>()));

    Get.lazyPut(() => AreasRemoteDataSource(
        service: Get.find<ServiceGenerator>(),
        authManager: Get.find<AuthManager>()));
    Get.lazyPut(() =>
        AreasRepository(remoteDataSource: Get.find<AreasRemoteDataSource>()));
    Get.lazyPut(() => AreaInteractor(repository: Get.find<AreasRepository>()));

    Get.lazyPut(
      () => UserController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(
      () => LoginController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(
      () => ForgotController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(
      () => RegisterController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(
      () => ProfileController(userInteractor: Get.find<UserInteractor>()),
    );

    Get.lazyPut(() => AddressesController(
        areaInteractor: Get.find<AreaInteractor>(),
        userInteractor: Get.find<UserInteractor>()));
  }
}
