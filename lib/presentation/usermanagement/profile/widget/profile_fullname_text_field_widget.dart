
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileFullNameTextFieldWidget extends StatefulWidget {
  final String? fullname;

  const ProfileFullNameTextFieldWidget({super.key, required this.fullname});

  @override
  State<StatefulWidget> createState() => _ProfileFullNameTextFieldWidgetState();
}

class _ProfileFullNameTextFieldWidgetState
    extends State<ProfileFullNameTextFieldWidget> {
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
          initialValue: widget.fullname,
          validator: (value) => _profileController.validateTextField(value),
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _profileController.name = value;
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: MessageKeys.name.tr,
            labelText: MessageKeys.name.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text),
    );
  }
}
