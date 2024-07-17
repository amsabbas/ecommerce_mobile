import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  static void showMessageDialog(BuildContext context, String title,
      String message, String positiveButtonTitle, Function positiveCallBack) {
    Get.dialog(
      AlertDialog(
        surfaceTintColor: AppColors.whiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
        actions: <Widget>[
          TextButton(
              child: Text(positiveButtonTitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                Navigator.of(context).pop();
                positiveCallBack.call();
              }),
        ],
      ),
      barrierColor: AppColors.black12,
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: false,
    );
  }

  static void showConfirmationDialog(
      BuildContext context,
      String title,
      String message,
      String positiveButtonTitle,
      String negativeButtonTitle,
      Function positiveCallBack,
      Function negativeCallBack) {
    Get.dialog(
      AlertDialog(
        surfaceTintColor: AppColors.whiteColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(message, style: Theme.of(context).textTheme.bodyMedium),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  child: Text(positiveButtonTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    Navigator.of(context).pop();
                    positiveCallBack.call();
                  }),
              TextButton(
                  child: Text(negativeButtonTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    Navigator.of(context).pop();
                    negativeCallBack.call();
                  }),
            ],
          ),
        ],
      ),
      barrierColor: AppColors.black12,
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: false,
    );
  }
}
