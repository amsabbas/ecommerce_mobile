import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final registerState = ResultState();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  late final UserInteractor userInteractor;

  RegisterController({required this.userInteractor});

  void register() async {
    try {
      registerState.setLoading();
      registerState.setSuccess(await userInteractor.register(
          emailController.text,
          nameController.text,
          phoneController.text,
          passwordController.text));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      registerState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    registerState.close();
  }
}
