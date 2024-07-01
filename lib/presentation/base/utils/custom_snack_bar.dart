import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSuccessSnackBar(String title, String message) {
    Future.delayed(Duration.zero, () async {
      Get.snackbar(title, message,
          backgroundColor: AppColors.ceruleanBlueColor,
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            title,
            style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
          ),
          messageText: Text(
            message,
            style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
          ),
          maxWidth: Get.width/4);
    });
  }

  static void showFailureSnackBar(
      {required String title, required String message}) {
    Future.delayed(Duration.zero, () async {
      Get.snackbar(title, message,
          backgroundColor: AppColors.redColor,
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.TOP,
          snackStyle: SnackStyle.FLOATING,
          titleText: Text(
            title,
            style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
          ),
          messageText: Text(
            message,
            style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
          ),
          maxWidth: Get.width/4);
    });
  }
}
