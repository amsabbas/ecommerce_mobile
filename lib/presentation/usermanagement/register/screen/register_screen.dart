import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterController _registerController;
  late final Worker _registerWorker;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _registerController = Get.find<RegisterController>();
    _registerWorker = ever(
        _registerController.registerState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showError(res.error as AppErrorModel),
                  onSuccess: () => _showSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBarWidget(
        title: "",
        showBackIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              _logoWidget(),
              _titleWidget(),
              _formWidget(),
              _actionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.asset(
        AssetResource.appLogoImagePath,
        height: 80.0,
      ),
    );
  }

  Widget _titleWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        MessageKeys.registerTitle.tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.mainColor,
            ),
      ),
    );
  }

  Widget _actionWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              _registerController.register();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              MessageKeys.registerButtonTitle.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formWidget() {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              FormBuilderTextField(
                name: MessageKeys.email,
                controller: _registerController.emailController,
                decoration: InputDecoration(
                  labelText: MessageKeys.email.tr,
                  hintText: MessageKeys.email.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(errorText: MessageKeys.emptyTextFieldValidationMessage.tr),
                onSaved: (value) =>
                    (_registerController.emailController.text = value ?? ''),
              ),
              const SizedBox(
                height: 16,
              ),
              FormBuilderTextField(
                name: MessageKeys.name,
                controller: _registerController.nameController,
                decoration: InputDecoration(
                  labelText: MessageKeys.name.tr,
                  hintText: MessageKeys.name.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(errorText: MessageKeys.emptyTextFieldValidationMessage.tr),
                onSaved: (value) =>
                    (_registerController.nameController.text = value ?? ''),
              ),
              const SizedBox(
                height: 16,
              ),
              FormBuilderTextField(
                name: MessageKeys.phone,
                controller: _registerController.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: MessageKeys.phone.tr,
                  hintText: MessageKeys.phone.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(errorText: MessageKeys.emptyTextFieldValidationMessage.tr),
                onSaved: (value) =>
                    (_registerController.phoneController.text = value ?? ''),
              ),
              const SizedBox(
                height: 16,
              ),
              FormBuilderTextField(
                name: MessageKeys.password,
                controller: _registerController.passwordController,
                decoration: InputDecoration(
                  labelText: MessageKeys.password.tr,
                  hintText: MessageKeys.password.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                obscureText: true,
                validator: FormBuilderValidators.required(errorText: MessageKeys.emptyTextFieldValidationMessage.tr),
                onSaved: (value) =>
                    (_registerController.passwordController.text = value ?? ''),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showSuccess() {
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.registerSuccessMessage.tr);
    Get.back();
  }

  @override
  void dispose() {
    _registerWorker.dispose();
    super.dispose();
  }
}
