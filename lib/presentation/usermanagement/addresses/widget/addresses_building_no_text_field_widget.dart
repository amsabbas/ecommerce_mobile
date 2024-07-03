
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressApartmentNoTextFieldWidget extends StatefulWidget {
  const AddressApartmentNoTextFieldWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() =>
      _AddressApartmentNoTextFieldWidgetState();
}

class _AddressApartmentNoTextFieldWidgetState
    extends State<AddressApartmentNoTextFieldWidget> {
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
          maxLines: 1,
          validator: (value) => _addressesController.validateTextField(value),
          onSaved: (value) {
            if (value != null && value.isNotEmpty) {
              _addressesController.buildingNo = value;
            }
          },
          enabled: true,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: MessageKeys.buildNoHintTitle.tr,
            labelText: MessageKeys.buildingNoTitle.tr,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number),
    );
  }
}
