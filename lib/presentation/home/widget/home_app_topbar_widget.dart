import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/widget/cart_count_widget.dart';
import 'package:ecommerce_mobile/presentation/home/screen/home_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppTopBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const HomeAppTopBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: null,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.mainColor, fontWeight: FontWeight.bold),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.mainColor,
                size: 24,
              ),
              onPressed: () => Get.to(() => const HomeSearchScreen()),
            ),
          ],
        ),
        GetX<UserController>(
            init: userController,
            builder: (controller) {
              int? productsQuantity = userController.productsQuantity.value;
              if (productsQuantity != null && productsQuantity > 0) {
                return CartCountWidget(
                  productsQuantity: productsQuantity,
                );
              } else {
                return const CartCountWidget(
                  productsQuantity: null,
                );
              }
            }),
      ],
      centerTitle: false,
    );
  }
}
