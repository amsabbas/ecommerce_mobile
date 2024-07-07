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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                        child: CachedNetworkImage(
                      imageUrl:
                          "$baseURL${cartModel.product.photoUrl?.replaceAll("localhost:3000/", "")}",
                      // "$scheme://" + element.photoUrl,
                      fit: BoxFit.fitHeight,
                      height: 100,
                      width: 100,
                    )),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(product.name!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.ceruleanBlueColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
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
                    "${product.price!.roundDouble()} $currency",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.greenColor),
                  ),
              ],
            ),
            CartQuantityWidget(
              productID: product.id!,
              quantity: cartModel.quantity,
              deleteProductCallback: deleteProductCallback,
            ),
          ]),
    );
  }
}