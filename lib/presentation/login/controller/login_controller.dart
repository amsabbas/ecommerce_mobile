import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/base/utils/app_logger.dart';
import '../../base/utils/result.dart';

class LoginController extends GetxController {
  final loginState = ResultState();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final UserInteractor userInteractor;

  LoginController({required this.userInteractor});

  void login() async {
    try {
      loginState.setLoading();
      loginState.setSuccess(await userInteractor.login(
          emailController.text, passwordController.text));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      loginState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    loginState.close();
  }
}
