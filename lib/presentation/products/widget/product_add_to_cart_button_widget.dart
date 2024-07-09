import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddToCartButtonWidget extends StatelessWidget {
  final Function()? onPressed;

  const ProductAddToCartButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
    );
  }
}
