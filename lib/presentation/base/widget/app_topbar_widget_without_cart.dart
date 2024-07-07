import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTopBarWithoutCartWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool showBackIcon;

  const AppTopBarWithoutCartWidget(
      {super.key, required this.title, required this.showBackIcon});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: showBackIcon
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.ceruleanBlueColor,
              ),
              onPressed: () => Get.back(),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.ceruleanBlueColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      centerTitle: false,
    );
  }
}