import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/account_not_logged_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget_without_cart.dart';
import 'package:ecommerce_mobile/presentation/base/widget/empty_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/error_widget.dart';
import 'package:ecommerce_mobile/presentation/base/widget/loading_widget.dart';
import 'package:ecommerce_mobile/presentation/cart/controller/cart_controller.dart';
import 'package:ecommerce_mobile/presentation/cart/widget/cart_checkout_button_widget.dart';
import 'package:ecommerce_mobile/presentation/cart/widget/cart_item_widget.dart';
import 'package:ecommerce_mobile/presentation/checkout/screen/checkout_screen.dart';
import 'package:ecommerce_mobile/presentation/checkout/utils/checkout_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartController _cartController;
  late final UserController _userController;
  late final Worker _deleteCartWorker,
      _checkCartAvailabilityWorker,
      _userWorker;

  @override
  void initState() {
    super.initState();
    _cartController = Get.find();
    _userController = Get.find();
    if (_userController.userState.value != null) {
      _cartController.getMyCarts();
    }
    _deleteCartWorker = ever(
        _cartController.deleteCartState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () {
                    _cartController.getMyCarts();
                    _userController.refreshProductQuantity();
                  },
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
    _checkCartAvailabilityWorker = ever(
        _cartController.checkCartAvailabilityState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () {
                    Get.to(() => const CheckoutScreen(),
                        binding: CheckoutBindings());
                  },
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
    _userWorker = ever(
        _userController.userState,
        (UserModel? userModel) => {
              if (userModel != null) {_cartController.getMyCarts()}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWithoutCartWidget(
          title: MessageKeys.cartTitle.tr,
          showBackIcon: false,
        ),
        body: GetX<UserController>(
            init: _userController,
            builder: (controller) {
              UserModel? userModel = _userController.userState.value;
              if (userModel != null) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: GetX<CartController>(
                        init: _cartController,
                        builder: (controller) => controller.getMyCartsState
                            .handleStateInWidget(
                                onSuccess: (context, data) => myCartWidget(),
                                onLoading: (context, data) =>
                                    loadingWidget(context),
                                onNormal: (context, data) =>
                                    loadingWidget(context),
                                onError: (context, data) => _errorWidget(),
                                context: context)));
              } else {
                return const AccountNotLoggedWidget();
              }
            }));
  }

  Widget myCartWidget() {
    List<CartModel> response = _cartController.getMyCartsState.value.data;

    if (response.isEmpty) {
      return Column(
        children: [
          Expanded(
            child: Center(
              child: EmptyWidget(
                message: MessageKeys.noCartTitle.tr,
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.generate(
                        response.length,
                        (index) => CartItemWidget(
                              cartModel: response[index],
                              deleteProductCallback: () {
                                _cartController.deleteCart(response[index].id);
                              },
                            )),
                  ),
                ],
              ),
            ),
          ),
          CartCheckoutButtonWidget(
            callback: () {
              _cartController.checkCartAvailabilityCart();
            },
          ),
        ],
      );
    }
  }

  void _showSnackBarError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  Widget _errorWidget() {
    return Center(
      child: AppErrorWidget(retryCallback: () {
        _cartController.getMyCarts();
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _deleteCartWorker.dispose();
    _checkCartAvailabilityWorker.dispose();
    _userWorker.dispose();
  }
}
