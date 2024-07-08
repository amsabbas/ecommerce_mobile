import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'account_item_widget.dart';

class AccountReachOutWidget extends StatelessWidget {
  const AccountReachOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsController appSettingsController = Get.find();
    SettingModel? settingModel = appSettingsController.settingsState.value.data;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MessageKeys.reachOutTitle.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor,width: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                AccountItemWidget(
                    title: MessageKeys.callUsTitle.tr,
                    imagePath: AssetResource.accountCallUsImagePath,
                    tapCallback: () {
                      if (settingModel != null) {
                        launchUrlString("tel://${settingModel.phone}");
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
