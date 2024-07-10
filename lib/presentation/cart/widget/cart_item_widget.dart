import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/cart/model/cart_model.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/cart/widget/cart_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartModel;
  final Function deleteProductCallback;

  const CartItemWidget(
      {super.key,
      required this.cartModel,
      required this.deleteProductCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.darkGrayColor, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: "$scheme://${cartModel.product.photoUrl!}",
                      fit: BoxFit.fitHeight,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _productDetailWidget(context, cartModel.product),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productDetailWidget(context, ProductModel product) {
    bool isProductAvailable = product.isAvailable!;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(product.getNameByLocale(Get.locale.toString())!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.mainColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isProductAvailable)
                Text(
                  MessageKeys.outOfStockTitle.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.redColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (isProductAvailable)
                Text(
                  "${product.price!.roundDouble()} ${MessageKeys.currency.tr}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.greenColor),
                ),
            ],
          ),
          const SizedBox(height: 8),
          CartQuantityWidget(
            productID: product.id!,
            quantity: cartModel.quantity,
            deleteProductCallback: deleteProductCallback,
          ),
        ]);
  }
}
