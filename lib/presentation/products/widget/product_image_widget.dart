import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_mobile/data/products/model/product_model.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductImageWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
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
}
