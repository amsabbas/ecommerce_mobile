
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressFloorNoTextFieldWidget extends StatefulWidget {
  const AddressFloorNoTextFieldWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AddressFloorNoTextFieldWidgetState();
}

class _AddressFloorNoTextFieldWidgetState
    extends State<AddressFloorNoTextFieldWidget> {
  late final AddressesController _addressesController;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: TextFormField(
          validator: (value) => _addressesController.validateTextField(value),
          maxLines: 1,
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _addressesController.floorNo = (value);
            }
          },
          enabled: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: MessageKeys.floorNoHintTitle.tr,
            labelText: MessageKeys.floorNoTitle.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number),
    );
  }
}
