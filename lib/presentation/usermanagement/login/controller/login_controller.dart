import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return MessageKeys.emptyTextFieldValidationMessage.tr;
    } else if (!GetUtils.isEmail(value)) {
      return MessageKeys.emailTextFieldValidationMessage.tr;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    loginState.close();
  }
}
