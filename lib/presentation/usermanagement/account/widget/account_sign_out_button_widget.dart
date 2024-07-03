import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSignOutButtonWidget extends StatelessWidget {
  const AccountSignOutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: AppColors.redColor,
        ),
        onPressed: () {
          CustomDialogs.showConfirmationDialog(
              context,
              MessageKeys.alert.tr,
              MessageKeys.logoutMessage.tr,
              MessageKeys.ok.tr,
              MessageKeys.cancel.tr, () {
            userController.logout();
          }, () {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MessageKeys.logoutButtonTitle.tr,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
