import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  final forgotState = ResultState();
  final emailController = TextEditingController();
  late final UserInteractor userInteractor;

  ForgotController({required this.userInteractor});

  void forgot() async {
    try {
      forgotState.setLoading();
      forgotState.setSuccess(await userInteractor.forgotPassword(
          emailController.text));
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      forgotState.setError(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
    forgotState.close();
  }
}
