import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/empty_app_bar.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/forgot/screen/forgot_screen.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/login/controller/login_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/register/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _loginController;
  late final UserController _userController;
  late final Worker _loginWorker;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _loginController = Get.find<LoginController>();
    _userController = Get.find<UserController>();
    _loginWorker = ever(
        _loginController.loginState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showLoginError(res.error as AppErrorModel),
                  onSuccess: () => _showLoginSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
          child: Column(
            children: [
              _logoWidget(),
              _titleWidget(),
              _formWidget(),
              _forgotPasswordWidget(),
              _actionWidget(),
              _registerWidget(),
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
        MessageKeys.appName.tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.mainColor,
            ),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => const ForgotScreen(),
                binding: UserBindings(), transition: appTransition);
          },
          child: Text(
            MessageKeys.forgotPasswordButtonTitle.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.mainColor,
                ),
          ),
        ),
      ],
    );
  }

  Widget _registerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          MessageKeys.registerNoAccountTitle.tr,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.mainColor,
              ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const RegisterScreen(),
                binding: UserBindings(), transition: appTransition);
          },
          child: Text(
            MessageKeys.registerButtonTitle.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  Widget _actionWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              _loginController.login();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              MessageKeys.loginButtonTitle.tr,
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
                controller: _loginController.emailController,
                decoration: InputDecoration(
                  labelText: MessageKeys.email.tr,
                  hintText: MessageKeys.email.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: true,
                validator: (value) => _loginController.validateEmail(value),
                onSaved: (value) =>
                    (_loginController.emailController.text = value ?? ''),
              ),
              const SizedBox(
                height: 16,
              ),
              FormBuilderTextField(
                name: MessageKeys.password,
                controller: _loginController.passwordController,
                decoration: InputDecoration(
                  labelText: MessageKeys.password.tr,
                  hintText: MessageKeys.password.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                obscureText: true,
                validator: FormBuilderValidators.required(
                    errorText: MessageKeys.emptyTextFieldValidationMessage.tr),
                onSaved: (value) =>
                    (_loginController.passwordController.text = value ?? ''),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLoginError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showLoginSuccess() {
    _userController.getProfile();
    Get.back();
  }

  @override
  void dispose() {
    _loginWorker.dispose();
    super.dispose();
  }
}
