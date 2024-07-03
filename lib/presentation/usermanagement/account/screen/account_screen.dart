import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/widget/account_not_logged_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/widget/account_reachout_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/widget/account_sign_out_button_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/widget/account_social_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/widget/account_title_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/account/widget/account_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWidget(
            title: MessageKeys.accountTitle.tr, showBackIcon: false),
        body: GetX<UserController>(
            init: _userController,
            builder: (controller) {
              UserModel? userModel = _userController.userState.value;
              if (userModel != null) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _accountWidget(),
                );
              } else {
                return const AccountNotLoggedWidget();
              }
            }));
  }

  Widget _accountWidget() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AccountUserWidget(),
          AccountTitleWidget(),
          //AccountSettingsWidget(),
          AccountReachOutWidget(),
          AccountSignOutButtonWidget(),
          AccountSocialWidget(),
        ],
      ),
    );
  }
}
