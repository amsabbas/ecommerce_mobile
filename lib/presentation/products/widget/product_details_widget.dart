import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/products/widget/product_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsWidget extends StatelessWidget{
  final ProductModel productModel;
  const ProductDetailsWidget({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    bool isProductAvailable = productModel.isAvailable!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(productModel.getNameByLocale(Get.locale.toString())!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.mainColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 1),
            Text(productModel.getDescByLocale(Get.locale.toString())!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.mainColor),
                textAlign: TextAlign.start,
                maxLines: 5),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    "${productModel.price!.roundDouble()} ${MessageKeys.currency.tr}",
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
}