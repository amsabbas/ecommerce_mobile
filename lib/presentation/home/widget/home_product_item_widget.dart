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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.darkGrayColor, width: 0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _productImageWidget(product),
                  const SizedBox(width: 16),
                  _productDetailsWidget(context, product),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget _productImageWidget(ProductModel product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: CachedNetworkImage(
        imageUrl: "$scheme://${product.photoUrl!}",
        fit: BoxFit.fitHeight,
        height: 100,
        width: 100,
      ),
    );
  }

  Widget _productDetailsWidget(context, ProductModel product) {
    bool isProductAvailable = product.isAvailable!;
    return Expanded(
      child: Column(
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
            )
          ]),
    );
  }
}
