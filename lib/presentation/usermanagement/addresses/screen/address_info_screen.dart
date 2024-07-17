import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/address_add_button_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_apartment_no_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_building_no_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_floor_no_text_field_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_street_name_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressInfoScreen extends StatefulWidget {
  const AddressInfoScreen({super.key});

  @override
  State<AddressInfoScreen> createState() => _AddressInfoScreenState();
}

class _AddressInfoScreenState extends State<AddressInfoScreen> {
  late final AddressesController _addressesController;
  late final GlobalKey<FormState> _addressInfoForm;
  late final Worker _addAddressWorker;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find<AddressesController>();
    _addressInfoForm = GlobalKey<FormState>();
    _addAddressWorker = ever(
        _addressesController.addAddressState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () =>
                      _showAddAddressError(res.error as AppErrorModel),
                  onSuccess: () => _showAddAddressSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWithoutCartWidget(
        title: MessageKeys.shippingAddressTitle.tr,
        showBackIcon: true,
      ),
      body: Form(
        key: _addressInfoForm,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AddressesStreetNameTextFieldWidget(),
                const SizedBox(
                  height: 16,
                ),
                const AddressBuildingNolTextFieldWidget(),
                const SizedBox(
                  height: 16,
                ),
                const AddressFloorNoTextFieldWidget(),
                const SizedBox(
                  height: 16,
                ),
                const AddressApartmentNoTextFieldWidget(),
                const SizedBox(
                  height: 16,
                ),
                _addAddressButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addAddressButton() {
    return AddressAddButtonWidget(onClick: () {
      _validateAndSave();
    });
  }

  void _validateAndSave() {
    if (_addressInfoForm.currentState == null) {
      return;
    }
    final isValid = _addressInfoForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _addressInfoForm.currentState!.save();
    _addressesController.addAddress();
  }

  void _showAddAddressError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showAddAddressSuccess() {
    _addressesController.refreshAddresses();
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.addAddressSuccessMessage.tr);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _addAddressWorker.dispose();
  }
}
