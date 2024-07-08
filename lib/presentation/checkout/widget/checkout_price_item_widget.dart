import 'package:ecommerce_mobile/presentation/base/language/language.dart';
import 'package:ecommerce_mobile/presentation/base/model/constants.dart';
import 'package:ecommerce_mobile/presentation/base/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPriceItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const CheckoutPriceItemWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$value ${MessageKeys.currency.tr}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.mainColor,
                  ),
            ),
          ],
        ));
  }
}
