import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/base/model/app_error_model.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/data/user/model/user_model.dart';
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_loading.dart';
import 'package:ecommerce_mobile/presentation/base/utils/custom_snack_bar.dart';
import 'package:ecommerce_mobile/presentation/base/utils/result.dart';
import 'package:ecommerce_mobile/presentation/base/widget/app_topbar_widget.dart';
import 'package:ecommerce_mobile/presentation/products/controller/products_controller.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_quantity_widget.dart';
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
              _productImage(),
              _productDetailsWidget(),
              _addToMyCart()
            ],
          ),
        ));
  }

  Widget _productImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
          child: CachedNetworkImage(
        imageUrl:
            "$baseURL${productModel.photoUrl?.replaceAll("localhost:3000/", "")}",
        // "$scheme://" + element.photoUrl,
        fit: BoxFit.fitWidth,
        height: 250,
      )),
    );
  }

  Widget _productDetailsWidget() {
    bool isProductAvailable = productModel.isAvailable!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(productModel.name!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.ceruleanBlueColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 1),
            Text(productModel.description!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.ceruleanBlueColor),
                textAlign: TextAlign.start,
                maxLines: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isProductAvailable)
                  Text(
                    MessageKeys.outOfStockTitle.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.redColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (isProductAvailable)
                  Text(
                    "${productModel.price!.roundDouble()} $currency",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.greenColor),
                  ),
                ProductQuantityWidget(
                  productID: productModel.id!,
                )
              ],
            )
          ]),
    );
  }

  Widget _addToMyCart() {
    return GetX<UserController>(
        init: _userController,
        builder: (controller) {
          UserModel? userModel = _userController.userState.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: ElevatedButton(
              onPressed: userModel == null || !productModel.isAvailable!
                  ? null
                  : () {
                      _productsController.addProductToMyCart(productModel.id!);
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_shopping_cart),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      MessageKeys.addToMyCartButtonTitle.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
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
    CustomSnackBar.showSuccessSnackBar(
        MessageKeys.success.tr, MessageKeys.addToMyCartSuccessMessage.tr);
  }

  @override
  void dispose() {
    super.dispose();
    _addProductToMyCartWorker.dispose();
  }
}
