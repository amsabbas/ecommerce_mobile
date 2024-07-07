import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCheckoutButtonWidget extends StatelessWidget {
  final Function callback;

  const CartCheckoutButtonWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      child: ElevatedButton(
        onPressed: () {
          callback.call();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                MessageKeys.checkoutTitle.tr,
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
  }
}
