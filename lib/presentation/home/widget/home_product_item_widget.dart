import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/extension/double_extension.dart';
import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel product;

  const ProductItemWidget({super.key, required this.product});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _productImageWidget(widget.product),
          _productDetailsWidget(context, widget.product),
          _productFooterWidget(context, widget.product)
        ],
      ),
    );
  }


  Widget _productImageWidget(ProductModel product) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
              child: CachedNetworkImage(
            imageUrl:
                "http://192.168.1.8:3000/${product.photoUrl?.replaceAll("localhost:3000/", "")}",
            // "$scheme://" + element.photoUrl,
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          )),
        ),
      ],
    );
  }

  Widget _productDetailsWidget(context, ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(product.name!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.ceruleanBlueColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                maxLines: 1),
          ]),
    );
  }

  Widget _productFooterWidget(context, ProductModel product) {
    bool isProductAvailable = product.isAvailable!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!isProductAvailable)
          Text(
            MessageKeys.outOfStockTitle.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.redColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        Text(
          "${product.price!.roundDouble()} $currency",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.greenColor),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
