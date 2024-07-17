import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_item_widget.dart';

class AccountLogoutWidget extends StatelessWidget {
  const AccountLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MessageKeys.seeYouSoonTitle.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Card(
            margin: const EdgeInsets.all(0),
            color: AppColors.lightWhiteColor,
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                AccountItemWidget(
                    title: MessageKeys.logoutButtonTitle.tr,
                    imagePath: AssetResource.accountLogoutImagePath,
                    tapCallback: () {
                      CustomDialogs.showConfirmationDialog(
                          context,
                          MessageKeys.alert.tr,
                          MessageKeys.logoutMessage.tr,
                          MessageKeys.ok.tr,
                          MessageKeys.cancel.tr, () {
                        userController.logout();
                      }, () {});
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
