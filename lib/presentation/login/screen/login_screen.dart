import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/home/screen/home_screen.dart';
import 'package:ecommerce_mobile/presentation/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../base/language/language.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _loginController;
  late final Worker _loginWorker;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _loginController = Get.find<LoginController>();
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
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 80),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _logoWidget(),
                    _titleWidget(),
                    _formWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Image.asset(
        AssetResource.appLogoImagePath,
        height: 80.0,
      ),
    );
  }

  Widget _titleWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          MessageKeys.webAdmin.tr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.ceruleanBlueColor,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(
            MessageKeys.adminPortalLogin.tr,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.ceruleanBlueColor,
                ),
          ),
        ),
      ],
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
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: FormBuilderTextField(
                  name: MessageKeys.username,
                  controller: _loginController.emailController,
                  decoration: InputDecoration(
                    labelText: MessageKeys.username.tr,
                    hintText: MessageKeys.username.tr,
                    border: const OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  enableSuggestions: false,
                  validator: FormBuilderValidators.required(),
                  onSaved: (value) => (_loginController.emailController.text = value ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: FormBuilderTextField(
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
                  validator: FormBuilderValidators.required(),
                  onSaved: (value) => ( _loginController.passwordController.text= value ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  height: 40.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        _loginController.login();
                      }
                    },
                    child: Text(MessageKeys.loginButtonTitle.tr),
                  ),
                ),
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
    Get.to(() => const HomeScreen());
  }

  @override
  void dispose() {
    _loginWorker.dispose();
    super.dispose();
  }
}
