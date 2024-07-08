import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/screen/map_screen.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/address_add_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressesSelectAreaWidget extends StatefulWidget {
  final List<AreaModel> areas;

  const AddressesSelectAreaWidget({super.key, required this.areas});

  @override
  State<AddressesSelectAreaWidget> createState() =>
      _AddressesSelectAreaWidgetState();
}

class _AddressesSelectAreaWidgetState extends State<AddressesSelectAreaWidget> {
  late final AddressesController _addressesController;
  late final GlobalKey<FormState> _areasForm;
  late final Worker _getLocationWorker;
  AreaModel? _areaValue;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find<AddressesController>();
    _areasForm = GlobalKey<FormState>();
    _getLocationWorker = ever(
        _addressesController.getLocationState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () =>
                      _showGetLocationError(res.error as AppErrorModel),
                  onSuccess: () => _showGetLocationSuccess(res.data),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        color: AppColors.whiteColor,
      ),
      child: Form(
        key: _areasForm,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title(),
                const SizedBox(
                  height: 32,
                ),
                _areas(),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 32,
                ),
                _addButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      MessageKeys.selectLocationTitle.tr,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(color: AppColors.ceruleanBlueColor),
    );
  }

  Widget _areas() {
    return DropdownButtonFormField<AreaModel>(
      isExpanded: true,
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(),
      ),
      validator: (value) => _addressesController
          .validateTextField(value?.getNameByLocale(Get.locale.toString())),
      padding: EdgeInsets.zero,
      iconEnabledColor: AppColors.ceruleanBlueColor,
      value: _areaValue,
      hint: Text(
        MessageKeys.areasTitle.tr,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.eclipseColor),
      ),
      items: widget.areas.map((AreaModel value) {
        return DropdownMenuItem<AreaModel>(
          value: value,
          child: Text(value.getNameByLocale(Get.locale.toString()),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.eclipseColor)),
        );
      }).toList(),
      onChanged: (val) {
        setState(() {
          _areaValue = val;
        });
        _addressesController.selectedRegion = _areaValue;
      },
    );
  }

  Widget _addButton() {
    return AddressAddButtonWidget(onClick: () {
      _validateAndSave();
    });
  }

  void _validateAndSave() {
    if (_areasForm.currentState == null) {
      return;
    }
    final isValid = _areasForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _areasForm.currentState!.save();
    _addressesController.getLocation();
  }

  void _showGetLocationError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showGetLocationSuccess(Position position) {
    Navigator.pop(context);
    Get.to(() => const MapScreen(),
        arguments: [position.latitude, position.longitude]);
  }

  @override
  void dispose() {
    super.dispose();
    _getLocationWorker.dispose();
  }
}
