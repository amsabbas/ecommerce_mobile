import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/checkout/interactor/checkout_interactor.dart';
import 'package:ecommerce_mobile/data/checkout/model/cost_model.dart';
import 'package:ecommerce_mobile/data/orders/interactor/order_interactor.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/data/user/model/address_model.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final costState = ResultState<CostModel>();
  final primaryAddressState = ResultState<AddressModel>();
  final applyPromoState = ResultState<CostModel>();
  final submitOrderState = ResultState();

  late final CheckoutInteractor checkOutInteractor;
  late final OrderInteractor orderInteractor;
  late final UserInteractor userInteractor;

  final TextEditingController promoCodeController =
      TextEditingController(text: "");

  Rx<bool> isPromoCodeAdded = false.obs;
  Rx<bool> isPromoCodeError = false.obs;

  Rx<double> orderPrice = 0.0.obs;
  Rx<double> deliveryPrice = 0.0.obs;
  Rx<double> discount = 0.0.obs;
  Rx<double> totalPrice = 0.0.obs;

  Rx<String> paymentMethod = cashPayment.obs;

  CheckoutController(
      {required this.checkOutInteractor,
      required this.userInteractor,
      required this.orderInteractor});

  void getPrimaryAddress() async {
    try {
      primaryAddressState.setLoading();
      final response = await userInteractor.getPrimaryAddress();
      primaryAddressState.setSuccess(response);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      primaryAddressState.setError(error);
    }
  }

  void calculateCost() async {
    try {
      costState.setLoading();
      final response =
          await checkOutInteractor.calculateCost(promoCodeController.text);
      orderPrice.value = response.subtotal;
      deliveryPrice.value = response.deliveryFees;
      discount.value = response.discount;
      totalPrice.value = response.total;
      costState.setSuccess(response);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      costState.setError(error);
    }
  }

  void applyPromoCode() async {
    try {
      applyPromoState.setLoading();
      final response =
          await checkOutInteractor.calculateCost(promoCodeController.text);
      orderPrice.value = response.subtotal;
      deliveryPrice.value = response.deliveryFees;
      discount.value = response.discount;
      totalPrice.value = response.total;
      if (promoCodeController.text.isEmpty) {
        isPromoCodeAdded.value = false;
      } else {
        isPromoCodeAdded.value = true;
      }
      isPromoCodeError.value = false;
      applyPromoState.setSuccess(response);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      isPromoCodeError.value = true;
      isPromoCodeAdded.value = false;
      applyPromoState.setError(error);
    }
  }

  void removePromoCode() {
    promoCodeController.text = "";
    isPromoCodeAdded.value = false;
    applyPromoCode();
  }

  void createOrder() async {
    if (paymentMethod.value == visaPayment) {
      createOnlineOrder();
      return;
    }

    try {
      submitOrderState.setLoading();
      final response =
          await orderInteractor.createOrder(promoCodeController.text);
      submitOrderState.setSuccess(response);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      submitOrderState.setError(error);
    }
  }

  void createOnlineOrder() async {
    try {
      submitOrderState.setLoading();
      final response =
          await orderInteractor.createOnlineOrder(promoCodeController.text);
      submitOrderState.setSuccess(response);
    } catch (error, errorStack) {
      AppLogger.error(error: error, errorStack: errorStack);
      submitOrderState.setError(error);
    }
  }

  void reset()
  {
    if (isPromoCodeError.value) {
      promoCodeController.text = "";
      isPromoCodeAdded.value = false;
      isPromoCodeError.value = false;
      orderPrice.value = 0.0;
      deliveryPrice.value = 0.0;
      discount.value = 0.0;
      totalPrice.value = 0.0;
    }
    paymentMethod.value = cashPayment;
  }

  @override
  void dispose() {
    super.dispose();
    costState.close();
    submitOrderState.close();
    applyPromoState.close();
    primaryAddressState.close();
  }
}
