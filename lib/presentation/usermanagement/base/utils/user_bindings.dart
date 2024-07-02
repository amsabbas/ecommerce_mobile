
import 'package:ecommerce_mobile/data/base/network/service_generator.dart';
import 'package:ecommerce_mobile/data/base/utils/auth_manager.dart';
import 'package:ecommerce_mobile/data/user/datasource/user_remote_data_source.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/data/user/repository/user_repository_impl.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/forgot/controller/forgot_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/login/controller/login_controller.dart';
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
  }
}
