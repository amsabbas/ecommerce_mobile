import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountSocialWidget extends StatelessWidget {
  const AccountSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsController appSettingsController = Get.find();
    SettingModel? settingModel = appSettingsController.settingsState.value.data;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => {
              if (settingModel != null)
                {
                  launchUrl(Uri.parse(settingModel.facebookLink),
                      mode: LaunchMode.externalApplication)
                }
            },
            child: SvgPicture.asset(
              AssetResource.accountFacebookImagePath,
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          InkWell(
            onTap: () => {
              if (settingModel != null)
                {
                  launchUrl(Uri.parse(settingModel.instagramLink),
                      mode: LaunchMode.externalApplication)
                }
            },
            child: SvgPicture.asset(
              AssetResource.accountInstagramImagePath,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
