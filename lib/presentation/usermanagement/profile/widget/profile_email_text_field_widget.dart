
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileEmailTextFieldWidget extends StatefulWidget {
  final String? email;

  const ProfileEmailTextFieldWidget({super.key, required this.email});

  @override
  State<StatefulWidget> createState() => _ProfileEmailTextFieldWidgetState();
}

class _ProfileEmailTextFieldWidgetState
    extends State<ProfileEmailTextFieldWidget> {
  late final ProfileController _profileController;

  @override
  void initState() {
    super.initState();
    _profileController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: TextFormField(
          initialValue: widget.email,
          validator: (value) => _profileController.validateTextField(value),
          enabled: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: MessageKeys.email.tr,
            labelText: MessageKeys.email.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text),
    );
  }
}
