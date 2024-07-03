import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileMobileTextFieldWidget extends StatefulWidget {
  final String? mobile;

  const ProfileMobileTextFieldWidget({super.key, required this.mobile});

  @override
  State<StatefulWidget> createState() => _ProfileMobileTextFieldWidgetState();
}

class _ProfileMobileTextFieldWidgetState
    extends State<ProfileMobileTextFieldWidget> {
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
          style: Theme.of(context).inputDecorationTheme.labelStyle,
          initialValue: widget.mobile,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _profileController.phone = value;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: MessageKeys.phone.tr,
            hintText: "xxxxxxxxxx",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number),
    );
  }
}
