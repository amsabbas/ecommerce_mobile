import 'package:ecommerce_mobile/presentation/base/model/asset_resource.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/cart/screen/cart_screen.dart';
import 'package:ecommerce_mobile/presentation/cart/utils/cart_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartCountWidget extends StatelessWidget {
  final int? productsQuantity;

  const CartCountWidget({super.key, required this.productsQuantity});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      IconButton(
          icon: SvgPicture.asset(
            AssetResource.cartImagePath,
            width: 20,
            height: 20,
          ),
          onPressed: () =>
              Get.to(() => const CartScreen(), binding: CartBindings(),transition: appTransition)),
      if (productsQuantity != null && productsQuantity! > 0)
        ClipOval(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: AppColors.redColor,
            child: Text(
              productsQuantity.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        )
    ]);
  }
}
