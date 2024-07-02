
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';

class AppTopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackIcon;

  const AppTopBarWidget(
      {super.key, required this.title, required this.showBackIcon});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final TextDirection currentDirection = Directionality.of(context);
    final bool isRTL = currentDirection == TextDirection.rtl;
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: showBackIcon
          ? IconButton(
              icon: Transform.flip(
                  flipX: isRTL ? true : false,
                  child: const Icon(Icons.arrow_back,color: AppColors.ceruleanBlueColor,)),
              onPressed: () => Navigator.of(context).pop(),
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
