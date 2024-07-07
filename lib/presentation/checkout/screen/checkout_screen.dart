import 'package:ecommerce_mobile/data/appsettings/model/setting_model.dart';
import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/checkout/model/cost_model.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/app_settings_controller.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/refresh_status.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/controller/checkout_controller.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_address_empty_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_address_item_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_payment_item_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_price_item_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_promo_code_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_shipping_date_item_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/widget/checkout_submit_order_button_widget.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/controller/addresses_controller.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/addresses/screen/addresses_screen.dart';
import 'package:ecommerce_mobile/presentation/usermanagement/base/utils/user_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final CheckoutController _checkoutController;
  late final UserController _userController;
  late final AddressesController _addressesController;
  late final AppSettingsController _appSettingsController;
  late final Worker _submitOrderWorker,
      _applyPromoWorker,
      _refreshAddressWorker;

  @override
  void initState() {
    super.initState();
    _addressesController = Get.find<AddressesController>();
    _appSettingsController = Get.find();
    _checkoutController = Get.find();
    _userController = Get.find();
    _checkoutController.calculateCost();
    _checkoutController.getPrimaryAddress();

    _submitOrderWorker = ever(
        _checkoutController.submitOrderState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showError(res.error as AppErrorModel),
                  onSuccess: () => _showOrderSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
    _applyPromoWorker = ever(
        _checkoutController.applyPromoState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showError(res.error as AppErrorModel),
                  onSuccess: () => null,
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });

    _refreshAddressWorker =
        ever(_addressesController.getAddressesRefreshStatus, (value) {
      switch (value) {
        case RefreshStatus.refresh:
          _checkoutController.getPrimaryAddress();
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
          title: MessageKeys.checkoutTitle.tr,
          showBackIcon: true,
        ),
        body: GetX<CheckoutController>(
            init: _checkoutController,
            builder: (controller) => controller.primaryAddressState
                .handleStateInWidget(
                    onSuccess: (context, data) => _costWidget(),
                    onLoading: (context, data) => loadingWidget(context),
                    onNormal: (context, data) => loadingWidget(context),
                    onError: (context, data) => _errorAddressWidget(),
                    context: context)));
  }

  Widget _costWidget() {
    return GetX<CheckoutController>(
        init: _checkoutController,
        builder: (controller) => controller.costState.handleStateInWidget(
            onSuccess: (context, data) => _checkoutWidget(data),
            onLoading: (context, data) => loadingWidget(context),
            onNormal: (context, data) => loadingWidget(context),
            onError: (context, data) => _errorWidget(data as AppErrorModel),
            context: context));
  }

  Widget _checkoutWidget(CostModel data) {
    SettingModel? settingModel =
        _appSettingsController.settingsState.value.data;
    AddressModel addressModel =
        _checkoutController.primaryAddressState.value.data;
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckoutAddressItemWidget(addressModel: addressModel),
              CheckoutDateItemWidget(
                date: settingModel?.deliveryTime.toString() ?? "",
              ),
              const CheckoutPaymentItemWidget(
                paymentType: 'CASH',
              ),
              const CheckoutPromoCodeWidget(),
              GetX<CheckoutController>(
                  init: _checkoutController, //here
                  builder: (controller) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckoutPriceItemWidget(
                              title: MessageKeys.subTotalTitle.tr,
                              value: _checkoutController.orderPrice.value
                                  .roundDouble()),
                          CheckoutPriceItemWidget(
                              title: MessageKeys.deliveryFeesTitle.tr,
                              value: _checkoutController.deliveryPrice.value
                                  .roundDouble()),
                          CheckoutPriceItemWidget(
                              title: MessageKeys.discountTitle.tr,
                              value: _checkoutController.discount.value
                                  .roundDouble()),
                          CheckoutPriceItemWidget(
                              title: MessageKeys.totalAmountTitle.tr,
                              value: _checkoutController.totalPrice.value
                                  .roundDouble()),
                          CheckoutSubmitOrderButtonWidget(callback: () {
                            _checkoutController.createOrder();
                          })
                        ]);
                  }),
            ],
          ),
        )),
      ],
    );
  }

  Widget _errorWidget(AppErrorModel errorModel) {
    return Center(child: AppErrorWidget(retryCallback: () {
      _checkoutController.calculateCost();
    }));
  }

  Widget _errorAddressWidget() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: CheckoutAddressEmptyWidget(
        addAddressCallback: () {
          Get.to(() => const AddressesScreen(), binding: UserBindings());
        },
      ),
    );
  }

  void _showError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showOrderSuccess() {
    _orderAction();
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.checkoutSuccessMessage.tr);
  }

  void _orderAction() {
    _userController.refreshProductQuantity();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _submitOrderWorker.dispose();
    _applyPromoWorker.dispose();
    _refreshAddressWorker.dispose();
  }
}
