
import 'package:ecommerce_mobile/presentation/base/controller/user_controller.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:ecommerce_mobile/presentation/base/widget/cart_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackIcon;

  const AppTopBarWidget(
      {super.key, required this.title, required this.showBackIcon});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: showBackIcon
          ? IconButton(
              icon: const Icon(Icons.arrow_back,color: AppColors.mainColor,),
              onPressed: () => Get.back(),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        GetX<UserController>(
            init: userController,
            builder: (controller) {
              int? productsQuantity = userController.productsQuantity.value;
              if (productsQuantity != null && productsQuantity > 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CartCountWidget(
                      productsQuantity: productsQuantity,
                    ));
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CartCountWidget(
                    productsQuantity: null,
                  ),
                );
              }
            })
      ],
      centerTitle: false,
    );
  }
}
