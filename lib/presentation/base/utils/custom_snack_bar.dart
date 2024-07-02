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
          margin: const EdgeInsets.all(4),
          maxWidth: Get.width);
    });
  }

  static void showFailureSnackBar(
      {required String title, required String message}) {
    Future.delayed(Duration.zero, () async {
      Get.snackbar(title, message,
          backgroundColor: AppColors.redColor,
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
          margin: const EdgeInsets.all(4),
          maxWidth: Get.width);
    });
  }
}
