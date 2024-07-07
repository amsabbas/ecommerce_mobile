import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/products/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductScreen(), arguments: product);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _productImageWidget(product),
          const SizedBox(width: 16),
          _productDetailsWidget(context, product),
        ],
      ),
    );
  }

  Widget _productImageWidget(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
          child: CachedNetworkImage(
        imageUrl:
            "$baseURL${product.photoUrl?.replaceAll("localhost:3000/", "")}",
        // "$scheme://" + element.photoUrl,
        fit: BoxFit.fitHeight,
        height: 100,
        width: 100,
      )),
    );
  }

  Widget _productDetailsWidget(context, ProductModel product) {
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
            )
          ]),
    );
  }

}