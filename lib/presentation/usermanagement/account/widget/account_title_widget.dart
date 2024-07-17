import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/screen/addresses_screen.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_item_widget.dart';

class AccountTitleWidget extends StatelessWidget {
  const AccountTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MessageKeys.accountTitle.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.mainColor, fontWeight: FontWeight.bold),
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
                    title: MessageKeys.profileTitle.tr,
                    imagePath: AssetResource.accountImagePath,
                    tapCallback: () {
                      Get.to(() => const ProfileScreen(),
                          binding: UserBindings());
                    }),
                const Divider(
                  color: AppColors.lightGrayColor,
                  height: 1,
                ),
                AccountItemWidget(
                    title: MessageKeys.myAddressesTitle.tr,
                    imagePath: AssetResource.accountAddressesImagePath,
                    tapCallback: () {
                      Get.to(() => const AddressesScreen(),
                          binding: UserBindings());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
