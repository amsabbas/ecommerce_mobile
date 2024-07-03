import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final updateProfileState = ResultState();
  late final UserInteractor userInteractor;

  late String name;
  late String phone;

  ProfileController({required this.userInteractor});

  void updateProfile() async {
    try {
      updateProfileState.setLoading();
      updateProfileState.setSuccess(await userInteractor.updateProfile(
        name,
        phone,
      ));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      updateProfileState.setError(error);
    }
  }
}
