import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/cart/controller/cart_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartQuantityWidget extends StatefulWidget {
  final int productID;
  final int quantity;
  final Function deleteProductCallback;

  const CartQuantityWidget(
      {super.key,
      required this.productID,
      required this.quantity,
      required this.deleteProductCallback});

  @override
  State<CartQuantityWidget> createState() => _CartQuantityWidgetState();
}

class _CartQuantityWidgetState extends State<CartQuantityWidget> {
  late final CartItemController _cartItemController;
  late final Worker _addToMyCartWorker;
  late final UserController _userController;

  @override
  void initState() {
    super.initState();
    _userController = Get.find();
    _cartItemController = Get.put(
        CartItemController(productsInteractor: Get.find()),
        tag: widget.productID.toString());
    _cartItemController.quantity.value = widget.quantity;
    _addToMyCartWorker = ever(
        _cartItemController.addProductToMyCartState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showSnackBarError(res.error as AppErrorModel),
                  onSuccess: () => {_userController.refreshProductQuantity()},
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return GetX<CartItemController>(
        init: _cartItemController,
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: () {
                    if (_cartItemController.quantity.value > 1) {
                      _cartItemController.quantity.value -= 1;
                      _cartItemController.addProductToMyCart(widget.productID);
                    } else {
                      widget.deleteProductCallback.call();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.mainColor,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(_cartItemController.quantity.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.mainColor),
                  textAlign: TextAlign.start,
                  maxLines: 1),
              const SizedBox(width: 8),
              SizedBox(
                width: 30,
                height: 30,
                child: OutlinedButton(
                  onPressed: () {
                    _cartItemController.quantity.value += 1;
                    _cartItemController.addProductToMyCart(widget.productID);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.mainColor,
                    size: 15,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _showSnackBarError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  @override
  void dispose() {
    super.dispose();
    _addToMyCartWorker.dispose();
  }
}
