import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_add_to_cart_button_widget.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_details_widget.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_image_widget.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_view_my_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final UserController _userController;
  late final ProductsController _productsController;
  late final ProductModel productModel;
  late final Worker _addProductToMyCartWorker;

  @override
  void initState() {
    super.initState();
    productModel = Get.arguments;
    _userController = Get.find();
    _productsController = Get.put(
        ProductsController(productsInteractor: Get.find()),
        tag: productModel.id.toString());
    _addProductToMyCartWorker = ever(
        _productsController.addProductToMyCartState,
        (ResultData res) => {
              res.handleState(
                  onLoading: () => CustomLoading.onLoading(context),
                  onError: () => _showError(res.error as AppErrorModel),
                  onSuccess: () => _showSuccess(),
                  onLoadingFinish: () => CustomLoading.dismissLoading(context))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppTopBarWidget(
          title: MessageKeys.productDetailTitle.tr,
          showBackIcon: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductImageWidget(
                productModel: productModel,
              ),
              ProductDetailsWidget(
                productModel: productModel,
              ),
              _addToMyCart()
            ],
          ),
        ));
  }

  Widget _addToMyCart() {
    return GetX<UserController>(
        init: _userController,
        builder: (controller) {
          UserModel? userModel = _userController.userState.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: ProductAddToCartButtonWidget(
                onPressed: userModel == null || !productModel.isAvailable!
                    ? null
                    : () {
                        _productsController
                            .addProductToMyCart(productModel.id!);
                      }),
          );
        });
  }

  void _showError(AppErrorModel result) {
    CustomSnackBar.showFailureSnackBar(
        title: MessageKeys.error.tr,
        message: result.message ?? MessageKeys.unKnown.tr);
  }

  void _showSuccess() {
    _userController.refreshProductQuantity();
    Get.bottomSheet(isScrollControlled: true,
        StatefulBuilder(builder: (context, setState) {
      return const FractionallySizedBox(
          heightFactor: 0.5, child: ProductViewMyCartWidget());
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _addProductToMyCartWorker.dispose();
  }
}
