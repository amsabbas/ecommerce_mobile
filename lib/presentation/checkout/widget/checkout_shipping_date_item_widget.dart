import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutDateItemWidget extends StatelessWidget {
  final String date;

  const CheckoutDateItemWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0,left: 24.0, top: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MessageKeys.deliveryDateTitle.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 8,
          ),
          Text(date,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.mainColor,
                  )),
        ],
      ),
    );
  }
}
