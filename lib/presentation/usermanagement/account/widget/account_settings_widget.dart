
import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/dialog/account_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_item_widget.dart';

class AccountSettingsWidget extends StatefulWidget {
  const AccountSettingsWidget({super.key});

  @override
  State<AccountSettingsWidget> createState() => _AccountSettingsWidgetState();
}

class _AccountSettingsWidgetState extends State<AccountSettingsWidget> {
  late final AppSettingsController _settingsController;

  @override
  void initState() {
    super.initState();
    _settingsController = Get.find<AppSettingsController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MessageKeys.settingsTitle.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.ceruleanBlueColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.ceruleanBlueColor,width: 0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                AccountItemWidget(
                    title: MessageKeys.languageTitle.tr,
                    imagePath: AssetResource.accountLanguageImagePath,
                    tapCallback: () {
                      AccountDialogs.showLanguageDialog(context, (value) {
                        _changeLanguage(value);
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(String value) {
    _settingsController.saveLanguage(value);
    Get.updateLocale(Locale(value));
  }


}
