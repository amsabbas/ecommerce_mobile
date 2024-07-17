import 'package:ecommerce_mobile/data/areas/model/area_model.dart';
import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/refresh_status.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_dialogs.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/address_add_button_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/address_item_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_empty_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/widget/addresses_select_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  late final AddressesController _addressesController;
  late final Worker _areasWorker,
      _refreshAddressesWorker,
      _deleteWorker,
      _defaultAddressWorker;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find<AddressesController>();
    _addressesController.getAddresses();
    _areasWorker = ever(
        _addressesController.areasState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () => _showAreasSheet(res.data),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });

    _deleteWorker = ever(
        _addressesController.deleteAddressState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () => _showDeleteSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });

    _defaultAddressWorker = ever(
        _addressesController.setDefaultAddressState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () => _addressesController.refreshAddresses(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });

    _refreshAddressesWorker =
        ever(_addressesController.getAddressesRefreshStatus, (value) {
      switch (value) {
        case RefreshStatus.refresh:
          _addressesController.getAddresses();
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBarWithoutCartWidget(
        title: MessageKeys.myAddressesTitle.tr,
        showBackIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GetX<AddressesController>(
            init: _addressesController,
            builder: (controller) => controller.addressesState
                .handleStateInWidget(
                    onSuccess: (context, data) => _addressesWidget(context),
                    onLoading: (context, data) => loadingWidget(context),
                    onNormal: (context, data) => loadingWidget(context),
                    onError: (context, data) => _errorWidget(),
                    context: context)),
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: AppErrorWidget(retryCallback: () {
        _addressesController.getAddresses();
      }),
    );
  }

  Widget _addressesWidget(context) {
    List<AddressModel> response =
        _addressesController.addressesState.value.data;
    if (response.isEmpty) {
      return Center(
        child: AddressesEmptyWidget(
          addAddressCallback: () {
            _addressesController.getAreas();
          },
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView(
              children:
                  List<Widget>.generate(response.length, (index) {
                var data = response[index];
                return AddressItemWidget(
                  onSetDefaultCallback: () {
                    if (!data.isDefault) {
                      _addressesController.setDefaultAddress(data.addressId);
                    }
                  },
                  onDeleteCallback: () {
                    CustomDialogs.showConfirmationDialog(
                        context,
                        MessageKeys.alert.tr,
                        MessageKeys.deleteAddressConfirmationMessage.tr,
                        MessageKeys.ok.tr,
                        MessageKeys.cancel.tr, () {
                      _addressesController.deleteAddress(data.addressId);
                    }, () {});
                  },
                  addressModel: data,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: AddressAddButtonWidget(onClick: () {
              _addressesController.getAreas();
            }),
          )
        ],
      );
    }
  }

  void _showSnackBarError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showAreasSheet(List<AreaModel> response) {
    Get.bottomSheet(isScrollControlled: true,
        StatefulBuilder(builder: (context, setState) {
      return Wrap(
        children: [
          AddressesSelectAreaWidget(
            areas: response,
          ),
        ],
      );
    }));
  }

  void _showDeleteSuccess() {
    _addressesController.refreshAddresses();
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.deleteAddressSuccessMessage.tr);
  }

  @override
  void dispose() {
    super.dispose();
    _areasWorker.dispose();
    _refreshAddressesWorker.dispose();
    _deleteWorker.dispose();
    _defaultAddressWorker.dispose();
  }
}
