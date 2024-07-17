import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/controller/profile_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/widget/profile_email_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/widget/profile_fullname_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/widget/profile_mobile_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/widget/profile_save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _profileForm = GlobalKey<FormState>();
  late final ProfileController _profileController;
  late final UserController _userController;
  late final Worker _profileWorker;

  @override
  void initState() {
    super.initState();
    _profileController = Get.find();
    _userController = Get.find();
    _profileWorker = ever(
        _profileController.updateProfileState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () =>
                      _showUpdateProfileError(res.error as AppErrorModel),
                  onSuccess: () => _showUpdateProfileSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWithoutCartWidget(
          title: MessageKeys.profileTitle.tr, showBackIcon: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: _profileForm,
              child: GetX<UserController>(
                  init: _userController,
                  builder: (controller) {
                    UserModel? userModel = _userController.userState.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileFullNameTextFieldWidget(
                            fullname: userModel?.name),
                        ProfileMobileTextFieldWidget(mobile: userModel?.phone),
                        ProfileEmailTextFieldWidget(email: userModel?.email),
                        ProfileSaveButtonWidget(
                          callback: () {
                            validateAndSave();
                          },
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSave() {
    if (_profileForm.currentState == null) {
      return;
    }
    final isValid = _profileForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _profileForm.currentState!.save();
    _profileController.updateProfile();
  }

  void _showUpdateProfileError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showUpdateProfileSuccess() {
    _userController.getProfile();
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.updateProfileSuccessMessage.tr);
    Get.back();
  }

  @override
  void dispose() {
    _profileWorker.dispose();
    super.dispose();
  }
}
