import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_dialogs.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/forgot/controller/forgot_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late final ForgotController _forgotController;
  late final Worker _forgotWorker;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _forgotController = Get.find<ForgotController>();
    _forgotWorker = ever(
        _forgotController.forgotState,
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
      appBar: const AppTopBarWidget(title: "",showBackIcon: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
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
        MessageKeys.forgotPasswordTitle.tr,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.ceruleanBlueColor,
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
              _forgotController.forgot();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(MessageKeys.submitButtonTitle.tr),
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
                controller: _forgotController.emailController,
                decoration: InputDecoration(
                  labelText: MessageKeys.email.tr,
                  hintText: MessageKeys.email.tr,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                enableSuggestions: false,
                validator: FormBuilderValidators.required(),
                onSaved: (value) =>
                    (_forgotController.emailController.text = value ?? ''),
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
    CustomDialogs.showMessageDialog(context, MessageKeys.success.tr,
        MessageKeys.forgotPasswordSuccessMessage.tr, MessageKeys.ok.tr, () {
      Get.back();
    });
  }

  @override
  void dispose() {
    _forgotWorker.dispose();
    super.dispose();
  }
}
