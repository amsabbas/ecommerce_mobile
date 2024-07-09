import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/cart/screen/cart_screen.dart';
import 'package:ecommerce_mobile/presentation/cart/utils/cart_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductViewMyCartWidget extends StatelessWidget {
  const ProductViewMyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight:Radius.circular(16)),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              MessageKeys.addToMyCartSuccessMessage.tr,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buttonWidget(context, MessageKeys.continueShoppingButtonTitle.tr,
                () {
              Get.back();
            }),
            const SizedBox(height: 16),
            _buttonWidget(context, MessageKeys.viewMyCartButtonTitle.tr, () {
              Get.back();
              Get.to(() => const CartScreen(), binding: CartBindings());
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget(BuildContext context, String title, Function onPressed) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
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
